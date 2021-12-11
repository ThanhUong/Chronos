defmodule App.Projects.ProjectRole do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Accounts.User
  alias App.Projects.Project

  schema "project_roles" do
    field :name, :string
    timestamps()

    belongs_to :project, Project
    belongs_to :user, User
  end

  @doc false
  def changeset(project_role, attrs) do
    project_role
    |> cast(attrs, [])
    |> validate_required([])
  end
end
