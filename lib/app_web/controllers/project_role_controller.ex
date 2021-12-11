defmodule AppWeb.ProjectRoleController do
  use AppWeb, :controller

  alias App.Projects
  alias App.Projects.ProjectRole

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    project_roles = Projects.list_project_roles()
    render(conn, "index.json", project_roles: project_roles)
  end

  def create(conn, %{"project_role" => project_role_params}) do
    with {:ok, %ProjectRole{} = project_role} <- Projects.create_project_role(project_role_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.project_role_path(conn, :show, project_role))
      |> render("show.json", project_role: project_role)
    end
  end

  def show(conn, %{"id" => id}) do
    project_role = Projects.get_project_role!(id)
    render(conn, "show.json", project_role: project_role)
  end

  def update(conn, %{"id" => id, "project_role" => project_role_params}) do
    project_role = Projects.get_project_role!(id)

    with {:ok, %ProjectRole{} = project_role} <- Projects.update_project_role(project_role, project_role_params) do
      render(conn, "show.json", project_role: project_role)
    end
  end

  def delete(conn, %{"id" => id}) do
    project_role = Projects.get_project_role!(id)

    with {:ok, %ProjectRole{}} <- Projects.delete_project_role(project_role) do
      send_resp(conn, :no_content, "")
    end
  end
end
