defmodule DrawHunts.HuntScraper do
  use Timex

  alias DrawHunts.Hunt
  alias DrawHunts.Repo

  def scrape() do
    hunt_page = get_hunts("ADE")
    category = Floki.find(hunt_page, ".package-title") |> Floki.text |> String.trim
    current_hunts = Enum.map(Floki.find(hunt_page, "section"), fn(x) -> parse_hunt(x, category) end )
    final = Enum.reduce(current_hunts, [], fn(h, acc) -> acc ++ duplicate_hunt(h) end )
    Enum.map(final, fn(x) -> Repo.insert!(x) end )
  end

  def get_hunts(category) do
    html = HTTPoison.get!("https://tpwd.texas.gov/huntwild/hunt/public/public_hunt_drawing/hunt-category-details.phtml?OCat=#{category}").body
    huntdata = Floki.parse(html)
  end

  def duplicate_hunt(hunt) do
    Enum.map(hunt.alldates, fn(date) ->
      %{hunt | start_date: parse_hunt_date(date, 0), end_date: parse_hunt_date(date, 1)} end )
  end

  def parse_hunt_date(huntdate, idx) do
    # takes a string in format Oct 13, 2020 – Oct 15, 2020 and returns start or end
    {:ok, dt} = String.split(huntdate, "\u2013") |> Enum.at(idx) |> String.trim |> Timex.parse("%b %d, %Y", :strftime)
    Timex.to_date(dt)
  end

  def parse_hunt(hunt_section, category) do
    hunt =%Hunt{}
    hunt = %{hunt | location: Floki.find(hunt_section, ".title") |> Floki.text,
      category: category, type: "Special Permit Hunt"}

    hunt = Enum.reduce(Floki.find(hunt_section, ".data-wrapper"), hunt, fn(attr, acc) ->
      hunt_attr =  Floki.find(attr, ".data-header") |> Floki.text
      cells = Floki.find(attr, ".data-cell")
      acc = parse(hunt_attr, cells, acc)
    end)

  end

  def parse("Hunt Dates", cells, hunt) do
    huntdates = Enum.map(cells, &parse_single_huntdate/1)
    %{ hunt | alldates: huntdates}
  end

  def parse("Bag Limit", cells, hunt) do
    limit_data = Enum.at(cells, 0) # The first line only ever finds 1 so ?
    |> Floki.children
    |> Enum.take_every(2)
    |> parse_limits([]) # TODO This should probably be a map or a reduce

    %{hunt | bag_limit: limit_data}
  end

  def parse("Baiting", cells, hunt) do
    baiting = Enum.at(cells, 0)
    |> Floki.children
    |> Floki.text
    |> String.trim

    if baiting == "Allowed", do: %{ hunt | baiting: true}, else: %{hunt | baiting: false}
  end

  def parse("Hunt Method", cells, hunt) do
    method = Enum.at(cells, 0)
    |> Floki.children
    |> Floki.text
    |> String.trim

    %{hunt | method: method}
  end

  def parse("Permits", cells, hunt) do
    # Todo both of these work and both are awful. Regex maybe?
    available = Enum.at(cells, 0) |> Floki.text |> String.split(":") |> Enum.at(1) |> String.trim |> String.to_integer()
    fee = Enum.at(cells, 1) |> Floki.text |> String.trim |> String.split("$") |> Enum.at(1)
    |> String.split(".") |> Enum.at(0) |> String.to_integer()

    %{hunt | permits: available, fee: fee}
  end

  def parse("Last Year", cells, hunt) do
    applicants = Enum.at(cells, 0) |> Floki.text |> String.split(":") |> Enum.at(1) |> String.trim |> String.to_integer()
    permits = Enum.at(cells, 1) |> Floki.text |> String.split(":") |> Enum.at(1) |> String.trim |> String.to_integer()
    parsed = Enum.at(cells, 2) |> Floki.text |> String.split(":") |> Enum.at(1) |> String.trim()
    success = 0
    if String.ends_with?(parsed, "%"), do: success = String.slice(parsed, 0..-2) |> String.to_integer()

    %{hunt | previous_year_applicants: applicants,
      previous_year_permits: permits, previous_year_success: success}
  end

  def parse(_, _, hunt), do: hunt

  def parse_single_huntdate(data) do
    Floki.children(data)
    |> Enum.at(0)
    |> String.trim
  end

  def parse_limits([head | tail], limits) do
    limits = [ String.trim(head) | limits]
    parse_limits(tail, limits)
  end

  def parse_limits([], limits), do: limits
end
