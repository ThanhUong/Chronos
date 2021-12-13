defmodule App.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :image, :string
      add :stage_id, references(:stages, on_delete: :nothing)
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime

      timestamps()
    end
    create unique_index(:projects, [:stage_id])
  end
end
