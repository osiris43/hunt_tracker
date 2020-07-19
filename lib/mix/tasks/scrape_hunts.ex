defmodule Mix.Tasks.ScrapeHunts do
  use Mix.Task

  alias DrawHunts.HuntScraper

  def run(_) do
    Application.ensure_all_started(:hackney)
    HuntScraper.scrape()
  end
end
