defmodule DrawHunts.HuntScraper do
  alias DrawHunts.Hunt

  def scrape() do
    hunts = get_hunts("ADE")
    current_hunts = Enum.map(hunts, &parse_hunt/1)
    final = Enum.reduce(current_hunts, [], fn(x, acc) -> duplicate(x, acc) end)
    IO.inspect(final)
  end

  def get_hunts(category) do
    html = HTTPoison.get!("https://tpwd.texas.gov/huntwild/hunt/public/public_hunt_drawing/hunt-category-details.phtml?OCat=#{category}").body
    huntdata = Floki.parse(html)
    Floki.find(huntdata, "section")
  end

  def duplicate(hunt, acc) do
    # for each date in the hunt, return a Map with all other attributes
    # in the hunt plus the date
    acc ++ Enum.map(hunt[:dates], fn(x) -> Map.merge(hunt, %{dates: x}) end )
  end
  def parse_hunt(hunt) do
    hunt_data = %{}
    hunt_data = Map.put(hunt_data, :location, Floki.find(hunt, ".title") |> Floki.text)

    hunt_data = Enum.reduce(Floki.find(hunt, ".data-wrapper"), hunt_data, fn (attr, acc) ->
      hunt_attr =  Floki.find(attr, ".data-header") |> Floki.text
      parsed = parse(hunt_attr, attr)
      acc = Map.put(acc, elem(parsed, 0), elem(parsed, 1))
    end)
    #acc = Map.put(acc, :location, Floki.find(hunt, ".title") |> Floki.text)
    #acc = Map.put(acc, :dates, parse_huntdates(hunt))
    #acc = Map.put(acc, :bag_limits, parse_baglimit(hunt))
  end

  def parse("Hunt Dates", data_wrapper) do
    huntdates = Floki.find(data_wrapper, ".data-cell")
    |> Enum.map(&parse_single_huntdate/1)

    {:dates, huntdates}
  end

  def parse("Bag Limit", data_wrapper) do
    limit_data = Floki.find(data_wrapper, ".data-cell")
    |> Enum.at(0) # The first line only ever finds 1 so ?
    |> Floki.children
    |> Enum.take_every(2)
    |> parse_limits([]) # TODO This should probably be a map or a reduce

    {:bag_limits, limit_data}
  end

  def parse(_, data_wrapper) do
    {:not_used, "apple"}
  end

  def parse_huntdates(hunt) do
    huntdates = Floki.find(hunt, ".data-wrapper")
    |> Enum.at(0)
    |> Floki.find(".data-cell")
    |> Enum.map(&parse_single_huntdate/1)

  end

  def parse_single_huntdate(data) do
    a = Floki.children(data)
    |> Enum.at(0)
    |> String.split("\u2013")
    |> Enum.map(fn(x) -> String.trim(x) end)
  end

  def parse_baglimit(hunt) do
    {:ok, baglimit} = Floki.find(hunt, ".data-wrapper") |> Enum.fetch(1)
    limit_data = Floki.find(baglimit, ".data-cell") |> Enum.at(0) |> Floki.children |> Enum.take_every(2)
    limits = parse_limits(limit_data, [])
  end

  def parse_limits([head | tail], limits) do
    limits = [ String.trim(head) | limits]
    parse_limits(tail, limits)
  end

  def parse_limits([], limits), do: limits
end
