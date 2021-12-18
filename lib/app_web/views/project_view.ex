defmodule AppWeb.ProjectView do
  use AppWeb, :view
  alias AppWeb.{ProjectView, UserView, LeadSourceView, ProjectTypeView, StageView}

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    users = UserView.render("index.json", users: project.users)
    lead_source = LeadSourceView.render("show.json", lead_source: project.lead_source)
    project_type = ProjectTypeView.render("show.json", project_type: project.project_type)
    stage = StageView.render("show.json", stage: project.stage)
    %{
      id: project.id,
      name: project.name,
      users: users.user,
      lead_source: lead_source.data,
      project_type: project_type.data,
      stage: stage.data
    }
  end
end
