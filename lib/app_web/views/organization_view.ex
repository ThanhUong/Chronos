defmodule AppWeb.OrganizationView do
  use AppWeb, :view
  alias AppWeb.{OrganizationView, UserView, WorkflowView}

  def render("index.json", %{organizations: organizations}) do
    %{data: render_many(organizations, OrganizationView, "organization.json")}
  end

  def render("show.json", %{organization: organization}) do
    %{data: render_one(organization, OrganizationView, "organization.json")}
  end

  def render("organization.json", %{organization: organization}) do
    users = UserView.render("index.json", users: organization.users)
    %{
      id: organization.id,
      name: organization.name,
      users: users.user
    }
  end

  def render("index_without_users.json", %{organizations: organizations}) do
    %{data: render_many(organizations, OrganizationView, "organization_without_users.json")}
  end

  def render("organization_without_users.json", %{organization: organization}) do
    workflows = WorkflowView.render("index.json", workflows: organization.workflows)
    %{
      id: organization.id,
      name: organization.name,
      workflows: workflows.data
    }
  end
end
