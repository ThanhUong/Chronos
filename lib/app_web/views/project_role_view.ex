defmodule AppWeb.ProjectRoleView do
  use AppWeb, :view
  alias AppWeb.ProjectRoleView

  def render("index.json", %{project_roles: project_roles}) do
    %{data: render_many(project_roles, ProjectRoleView, "project_role.json")}
  end

  def render("show.json", %{project_role: project_role}) do
    %{data: render_one(project_role, ProjectRoleView, "project_role.json")}
  end

  def render("project_role.json", %{project_role: project_role}) do
    %{
      id: project_role.id
    }
  end
end
