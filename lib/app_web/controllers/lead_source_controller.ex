defmodule AppWeb.LeadSourceController do
  use AppWeb, :controller

  alias App.Projects
  alias App.Projects.LeadSource

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    lead_sources = Projects.list_lead_sources()
    render(conn, "index.json", lead_sources: lead_sources)
  end

  def create(conn, %{"lead_source" => lead_source_params}) do
    with {:ok, %LeadSource{} = lead_source} <- Projects.create_lead_source(lead_source_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.lead_source_path(conn, :show, lead_source))
      |> render("show.json", lead_source: lead_source)
    end
  end

  def show(conn, %{"id" => id}) do
    lead_source = Projects.get_lead_source!(id)
    render(conn, "show.json", lead_source: lead_source)
  end

  def update(conn, %{"id" => id, "lead_source" => lead_source_params}) do
    lead_source = Projects.get_lead_source!(id)

    with {:ok, %LeadSource{} = lead_source} <- Projects.update_lead_source(lead_source, lead_source_params) do
      render(conn, "show.json", lead_source: lead_source)
    end
  end

  def delete(conn, %{"id" => id}) do
    lead_source = Projects.get_lead_source!(id)

    with {:ok, %LeadSource{}} <- Projects.delete_lead_source(lead_source) do
      send_resp(conn, :no_content, "")
    end
  end
end
