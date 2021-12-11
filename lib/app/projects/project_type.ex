defmodule App.Projects.ProjectType do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.Project

  schema "project_types" do
    field :name, :string
    many_to_many :projects, Project, join_through: "projects_project_types"
    timestamps()
  end

  @doc false
  def changeset(project_type, attrs) do
    project_type
    |> cast(attrs, [])
    |> validate_required([])
  end
end
