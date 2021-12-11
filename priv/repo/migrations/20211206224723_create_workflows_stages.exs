defmodule App.Repo.Migrations.CreateWorkflowsStages do
  use Ecto.Migration

  def change do
    create table(:workflows_stages) do
      add :workflow_id, references(:workflows)
      add :stage_id, references(:stages)
    end

    create unique_index(:workflows_stages, [:workflow_id, :stage_id])
  end
end
