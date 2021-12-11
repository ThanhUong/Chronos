defmodule AppWeb.WorkflowView do
  use AppWeb, :view
  alias AppWeb.WorkflowView

  def render("index.json", %{workflows: workflows}) do
    %{data: render_many(workflows, WorkflowView, "workflow.json")}
  end

  def render("show.json", %{workflow: workflow}) do
    %{data: render_one(workflow, WorkflowView, "workflow.json")}
  end

  def render("workflow.json", %{workflow: workflow}) do
    %{
      id: workflow.id
    }
  end
end
