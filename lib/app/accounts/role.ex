defmodule App.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Accounts.{Organization, User}

  schema "roles" do
    field :description, :string
    field :name, :string

    timestamps()

    many_to_many :organizations, Organization, join_through: "organizations_users", on_replace: :delete
    many_to_many :users, User, join_through: "organizations_users", on_replace: :delete
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
