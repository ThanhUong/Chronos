defmodule AppWeb.WorkflowController do
  use AppWeb, :controller

  alias App.Projects
  alias App.Projects.Workflow

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    workflows = Projects.list_workflows()
    render(conn, "index.json", workflows: workflows)
  end

  def create(conn, %{"workflow" => workflow_params}) do
    with {:ok, %Workflow{} = workflow} <- Projects.create_workflow(workflow_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workflow_path(conn, :show, workflow))
      |> render("show.json", workflow: workflow)
    end
  end

  def show(conn, %{"id" => id}) do
    workflow = Projects.get_workflow!(id)
    render(conn, "show.json", workflow: workflow)
  end

  def update(conn, %{"id" => id, "workflow" => workflow_params}) do
    workflow = Projects.get_workflow!(id)

    with {:ok, %Workflow{} = workflow} <- Projects.update_workflow(workflow, workflow_params) do
      render(conn, "show.json", workflow: workflow)
    end
  end

  def delete(conn, %{"id" => id}) do
    workflow = Projects.get_workflow!(id)

    with {:ok, %Workflow{}} <- Projects.delete_workflow(workflow) do
      send_resp(conn, :no_content, "")
    end
  end
end
