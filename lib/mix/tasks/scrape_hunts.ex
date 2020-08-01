defmodule Mix.Tasks.ScrapeHunts do
  use Mix.Task

  alias DrawHunts.HuntScraper

  def run(params) do
    {args, _, _} = OptionParser.parse(params, strict: [category: :string])

    Mix.Task.run "app.start"
    HuntScraper.scrape(args[:category])
  end
end
