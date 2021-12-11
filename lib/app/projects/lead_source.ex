defmodule App.Projects.LeadSource do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Projects.Project

  schema "lead_sources" do
    field :name, :string
    many_to_many :projects, Project, join_through: "projects_lead_sources"
    timestamps()
  end

  @doc false
  def changeset(lead_source, attrs) do
    lead_source
    |> cast(attrs, [])
    |> validate_required([])
  end
end
