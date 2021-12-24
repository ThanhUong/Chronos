defmodule App.Projects.Stage do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.{Project, Workflow}

  schema "stages" do
    field :name, :string
    field :order, :integer
    timestamps()

    has_many :projects, Project
    belongs_to :workflow, Workflow

  end

  @doc false
  def changeset(stage, attrs) do
    stage
    |> cast(attrs, [:name, :order, :workflow_id])
    |> validate_required([:name, :order, :workflow_id])
  end
end
