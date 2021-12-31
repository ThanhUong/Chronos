defmodule AppWeb.ProjectController do
  use AppWeb, :controller

  alias App.Projects
  alias App.Projects.Project

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    projects = Projects.list_projects()
    render(conn, "index.json", projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Projects.create_project(project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.project_path(conn, :show, project))
      |> render("show.json", project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    render(conn, "show.json", project: project)
  end

  def show_projects_of_stage(conn, %{"id" => id}) do
    stage = Projects.get_stage!(id)
    projects = Projects.list_projects_of_stage(stage)
    render(conn, "index.json", projects: projects)
  end

  def show_projects_of_workflow(conn, %{"id" => id}) do
    workflow = Projects.get_workflow!(id)
    stages = Projects.list_stages_of_workflow(workflow)
    projects = Enum.reduce(stages, [], fn stage, acc ->
      acc ++ Projects.list_projects_of_stage(stage)
    end)
    render(conn, "index.json", projects: projects)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Projects.get_project!(id)

    with {:ok, %Project{} = project} <- Projects.update_project(project, project_params) do
      render(conn, "show.json", project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Projects.get_project!(id)

    with {:ok, %Project{}} <- Projects.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
