defmodule App.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Accounts.User
  alias App.Projects.{Stage, ProjectType, LeadSource}

  schema "projects" do
    field :name, :string
    field :image, :string
    field :start_date, :utc_datetime
    field :end_date, :utc_datetime
    timestamps()

    belongs_to :stage, Stage
    many_to_many :project_types, ProjectType, join_through: "projects_project_types"
    many_to_many :lead_sources, LeadSource, join_through: "projects_lead_sources"
    many_to_many :users, User, join_through: "users_projects"
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :image, :start_date, :end_date, :stage_id])
    |> validate_required([:name, :stage_id])
  end
end
