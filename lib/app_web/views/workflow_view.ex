defmodule AppWeb.WorkflowView do
  use AppWeb, :view
  alias AppWeb.{WorkflowView, StageView}

  def render("index.json", %{workflows: workflows}) do
    %{data: render_many(workflows, WorkflowView, "workflow.json")}
  end

  def render("show.json", %{workflow: workflow}) do
    %{data: render_one(workflow, WorkflowView, "workflow.json")}
  end

  def render("workflow.json", %{workflow: workflow}) do
    stages = StageView.render("index.json", stages: workflow.stages)
    %{
      id: workflow.id,
      stages: stages.data
    }
  end
end
