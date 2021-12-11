defmodule App.Repo.Migrations.CreateWorkflows do
  use Ecto.Migration

  def change do
    create table(:workflows) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:workflows, [:user_id])
  end
end
