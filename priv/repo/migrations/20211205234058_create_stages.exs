defmodule App.Repo.Migrations.CreateStages do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :name, :string
      add :order, :integer
      add :workflow_id, references(:workflows, on_delete: :delete_all)
      timestamps()
    end
  end
end
