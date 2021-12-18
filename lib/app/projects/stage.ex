defmodule App.Projects.Stage do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.{Project, Workflow}

  schema "stages" do
    field :name, :string
    timestamps()

    has_many :projects, Project
    many_to_many :workflows, Workflow, join_through: "workflows_stages"

  end

  @doc false
  def changeset(stage, attrs) do
    stage
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
