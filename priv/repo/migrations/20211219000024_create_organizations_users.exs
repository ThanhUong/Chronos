defmodule App.Repo.Migrations.CreateUsersOrganizations do
  use Ecto.Migration

  def change do
    create table(:organizations_users, primary_key: false) do
      # ensure the database prunes our join table records if a linked organization or user is deleted
      add :organization_id, references(:organizations, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)
      add :role_id, references(:roles, on_delete: :delete_all)
    end

    # create indexes for our foreign keys
    create index(:organizations_users, [:organization_id])
    create index(:organizations_users, [:user_id])
    create index(:organizations_users, [:role_id])

    # create unique index to prevent duplicate records
    create unique_index(:organizations_users, [:organization_id, :user_id, :role_id])
  end
end
