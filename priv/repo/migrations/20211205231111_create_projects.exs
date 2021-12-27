defmodule App.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :stage_id, references(:stages, on_delete: :nilify_all)
      add :project_type_id, references(:project_types, on_delete: :nilify_all)
      add :lead_source_id, references(:lead_sources, on_delete: :nilify_all)
      add :organization_id, references(:organizations, on_delete: :delete_all)
      timestamps()
    end
  end
end
