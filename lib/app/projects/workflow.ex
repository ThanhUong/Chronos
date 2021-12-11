defmodule App.Projects.Workflow do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.Stage
  alias App.Accounts.User

  schema "workflows" do
    many_to_many :stages, Stage, join_through: "workflows_stages"
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(workflow, attrs) do
    workflow
    |> cast(attrs, [])
    |> validate_required([])
  end
end
