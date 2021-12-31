defmodule App.Repo.Migrations.CreateLeadSources do
  use Ecto.Migration

  def change do
    create table(:lead_sources) do
      add :name, :string
      timestamps()
    end
  end
end
