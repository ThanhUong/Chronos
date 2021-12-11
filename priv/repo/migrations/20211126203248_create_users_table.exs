defmodule App.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      # add :id, :binary_id, primary_key: true
      add :username, :string
      add :email, :string
      add :password, :string
      add :image, :string

      timestamps()
    end

    create(unique_index(:users, [:username]))
    create unique_index(:users, [:email])
  end
end
