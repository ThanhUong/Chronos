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
    belongs_to :lead_source, LeadSource
    belongs_to :project_type, ProjectType
    many_to_many :users, User, join_through: "users_projects"
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :image, :start_date, :end_date])
    |> validate_required([:name])
  end
end
