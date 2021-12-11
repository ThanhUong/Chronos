defmodule App.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :stage_id, references(:stages, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:projects, [:stage_id])
  end
end
