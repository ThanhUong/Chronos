defmodule AppWeb.LeadSourceView do
  use AppWeb, :view
  alias AppWeb.LeadSourceView

  def render("index.json", %{lead_sources: lead_sources}) do
    %{data: render_many(lead_sources, LeadSourceView, "lead_source.json")}
  end

  def render("show.json", %{lead_source: lead_source}) do
    %{data: render_one(lead_source, LeadSourceView, "lead_source.json")}
  end

  def render("lead_source.json", %{lead_source: lead_source}) do
    %{
      id: lead_source.id
    }
  end
end
