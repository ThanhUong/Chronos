defmodule App.Accounts.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Accounts.User
  alias App.Projects.Project

  schema "organizations" do
    field :name, :string
    timestamps()

    has_many :projects, Project
    many_to_many :users, User, join_through: "organizations_users"
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
