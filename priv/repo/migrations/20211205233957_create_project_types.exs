defmodule App.Repo.Migrations.CreateProjectTypes do
  use Ecto.Migration

  def change do
    create table(:project_types) do
      add :name, :string
      timestamps()
    end

    create unique_index(:project_types, [:name])
  end
end
