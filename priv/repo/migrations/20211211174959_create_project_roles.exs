defmodule App.Repo.Migrations.CreateProjectRoles do
  use Ecto.Migration

  def change do
    create table(:project_roles) do
      add :name, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:project_roles, [:user_id])
    create unique_index(:project_roles, [:project_id])
  end
end
