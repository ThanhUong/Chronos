defmodule App.Repo.Migrations.CreateProjectsLeadSources do
  use Ecto.Migration

  def change do
    create table(:projects_lead_sources) do
      add :project_id, references(:projects)
      add :lead_source_id, references(:lead_sources)
    end

    create unique_index(:projects_lead_sources, [:project_id, :lead_source_id])
  end
end
