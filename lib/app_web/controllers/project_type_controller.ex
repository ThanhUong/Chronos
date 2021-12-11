defmodule AppWeb.ProjectTypeController do
  use AppWeb, :controller

  alias App.Projects
  alias App.Projects.ProjectType

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    project_types = Projects.list_project_types()
    render(conn, "index.json", project_types: project_types)
  end

  def create(conn, %{"project_type" => project_type_params}) do
    with {:ok, %ProjectType{} = project_type} <- Projects.create_project_type(project_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.project_type_path(conn, :show, project_type))
      |> render("show.json", project_type: project_type)
    end
  end

  def show(conn, %{"id" => id}) do
    project_type = Projects.get_project_type!(id)
    render(conn, "show.json", project_type: project_type)
  end

  def update(conn, %{"id" => id, "project_type" => project_type_params}) do
    project_type = Projects.get_project_type!(id)

    with {:ok, %ProjectType{} = project_type} <- Projects.update_project_type(project_type, project_type_params) do
      render(conn, "show.json", project_type: project_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    project_type = Projects.get_project_type!(id)

    with {:ok, %ProjectType{}} <- Projects.delete_project_type(project_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
