defmodule App.Repo.Migrations.CreateStages do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :name, :string
      timestamps()
    end
  end
end
