defmodule AppWeb.WorkflowControllerTest do
  use AppWeb.ConnCase

  import App.ProjectsFixtures

  alias App.Projects.Workflow

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all workflows", %{conn: conn} do
      conn = get(conn, Routes.workflow_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create workflow" do
    test "renders workflow when data is valid", %{conn: conn} do
      conn = post(conn, Routes.workflow_path(conn, :create), workflow: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.workflow_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.workflow_path(conn, :create), workflow: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update workflow" do
    setup [:create_workflow]

    test "renders workflow when data is valid", %{conn: conn, workflow: %Workflow{id: id} = workflow} do
      conn = put(conn, Routes.workflow_path(conn, :update, workflow), workflow: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.workflow_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, workflow: workflow} do
      conn = put(conn, Routes.workflow_path(conn, :update, workflow), workflow: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete workflow" do
    setup [:create_workflow]

    test "deletes chosen workflow", %{conn: conn, workflow: workflow} do
      conn = delete(conn, Routes.workflow_path(conn, :delete, workflow))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.workflow_path(conn, :show, workflow))
      end
    end
  end

  defp create_workflow(_) do
    workflow = workflow_fixture()
    %{workflow: workflow}
  end
end
