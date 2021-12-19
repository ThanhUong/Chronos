defmodule App.Repo.Migrations.CreateUsersOrganizations do
  use Ecto.Migration

  def change do
    create table(:users_organizations) do
      add :user_id, references(:users)
      add :organization_id, references(:organizations)
    end

    create unique_index(:users_organizations, [:user_id, :organization_id])
  end
end
