defmodule App.Projects.Workflow do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.Stage
  alias App.Accounts.Organization

  schema "workflows" do
    timestamps()

    has_many :stages, Stage
    belongs_to :organization, Organization
  end

  @doc false
  def changeset(workflow, attrs) do
    workflow
    |> cast(attrs, [:organization_id])
    |> validate_required([:organization_id])
  end
end
