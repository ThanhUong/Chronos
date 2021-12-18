defmodule App.Projects.Workflow do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.Stage

  schema "workflows" do
    many_to_many :stages, Stage, join_through: "workflows_stages"

    timestamps()
  end

  @doc false
  def changeset(workflow, attrs) do
    workflow
    |> cast(attrs, [])
    |> validate_required([])
  end
end
