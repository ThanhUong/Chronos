defmodule AppWeb.StageController do
  use AppWeb, :controller

  alias App.Projects
  alias App.Projects.Stage

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    stages = Projects.list_stages()
    render(conn, "index.json", stages: stages)
  end

  def create(conn, %{"stage" => stage_params}) do
    with {:ok, %Stage{} = stage} <- Projects.create_stage(stage_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.stage_path(conn, :show, stage))
      |> render("show.json", stage: stage)
    end
  end

  def show(conn, %{"id" => id}) do
    stage = Projects.get_stage!(id)
    render(conn, "show.json", stage: stage)
  end

  def update(conn, %{"id" => id, "stage" => stage_params}) do
    stage = Projects.get_stage!(id)

    with {:ok, %Stage{} = stage} <- Projects.update_stage(stage, stage_params) do
      render(conn, "show.json", stage: stage)
    end
  end

  def delete(conn, %{"id" => id}) do
    stage = Projects.get_stage!(id)

    with {:ok, %Stage{}} <- Projects.delete_stage(stage) do
      send_resp(conn, :no_content, "")
    end
  end
end
