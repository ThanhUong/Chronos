defmodule App.Repo.Migrations.CreateProjectsProjectTypes do
  use Ecto.Migration

  def change do
    create table(:projects_project_types) do
      add :project_id, references(:projects)
      add :project_type_id, references(:project_types)
    end

    create unique_index(:projects_project_types, [:project_id, :project_type_id])
  end
end
