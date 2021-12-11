defmodule App.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Bcrypt

  alias App.Projects.Project

  # @primary_key {:id, :binary_id, autogenerate: true}
  # @foreign_key_type :binary_id
  schema "users" do
    field :username, :string, unique: true
    field :email, :string, unique: true
    field :password, :string
    field :image, :string
    timestamps()

    many_to_many :projects, Project, join_through: "users_projects"
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :image, :password])
    |> validate_required([:email, :username, :password])
    |> unique_constraint(:username, name: :users_username_index)
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, add_hash(password, hash_key: :password))
  end

  defp put_pass_hash(changeset), do: changeset
end
