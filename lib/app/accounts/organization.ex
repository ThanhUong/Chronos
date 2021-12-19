defmodule App.Accounts.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  alias App.Accounts.User

  schema "organizations" do
    field :name, :string
    timestamps()

    many_to_many :users, User, join_through: "users_organizations"
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
