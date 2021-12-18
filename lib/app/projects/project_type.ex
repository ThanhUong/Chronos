defmodule App.Projects.ProjectType do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.Project

  schema "project_types" do
    field :name, :string
    has_many :projects, Project
    timestamps()
  end

  @doc false
  def changeset(project_type, attrs) do
    project_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
