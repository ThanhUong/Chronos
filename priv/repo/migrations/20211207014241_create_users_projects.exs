defmodule App.Repo.Migrations.CreateUsersProjects do
  use Ecto.Migration

  def change do
    create table(:users_projects, primary_key: false) do
      # ensure the database prunes our join table records if a linked user or project is deleted
      add :user_id, references(:users, on_delete: :delete_all)
      add :project_id, references(:projects, on_delete: :delete_all)
    end

    # create indexes for our foreign keys
    create index(:users_projects, [:user_id])
    create index(:users_projects, [:project_id])
    # create unique index to ensure a user cannot have duplicate projects
    create unique_index(:users_projects, [:user_id, :project_id])
  end
end
