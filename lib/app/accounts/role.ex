defmodule App.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Accounts.{Organization, User}

  schema "roles" do
    field :description, :string
    field :name, :string

    timestamps()

    many_to_many :organizations, Organization, join_through: "organizations_users"
    many_to_many :users, User, join_through: "organizations_users"
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
