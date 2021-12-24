defmodule App.Repo.Migrations.CreateWorkflows do
  use Ecto.Migration

  def change do
    create table(:workflows) do
      add :organization_id, references(:organizations, on_delete: :delete_all)
      timestamps()
    end
  end
end
