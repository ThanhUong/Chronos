defmodule App.Accounts.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Accounts.{User, Role}
  alias App.Projects.{Project, Workflow}

  schema "organizations" do
    field :name, :string
    timestamps()

    has_many :projects, Project
    has_many :workflows, Workflow
    many_to_many :users, User, join_through: "organizations_users"
    many_to_many :roles, Role, join_through: "organizations_users"
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
