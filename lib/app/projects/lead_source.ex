defmodule App.Projects.LeadSource do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.Project

  schema "lead_sources" do
    field :name, :string
    has_many :projects, Project
    timestamps()
  end

  @doc false
  def changeset(lead_source, attrs) do
    lead_source
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
