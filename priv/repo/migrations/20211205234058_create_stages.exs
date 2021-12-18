defmodule App.Repo.Migrations.CreateStages do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :name, :string
      timestamps()
    end

    create unique_index(:stages, [:name])
  end
end
