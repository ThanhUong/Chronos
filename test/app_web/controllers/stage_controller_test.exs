defmodule AppWeb.StageControllerTest do
  use AppWeb.ConnCase

  import App.ProjectsFixtures

  alias App.Projects.Stage

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stages", %{conn: conn} do
      conn = get(conn, Routes.stage_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stage" do
    test "renders stage when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stage_path(conn, :create), stage: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.stage_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stage_path(conn, :create), stage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stage" do
    setup [:create_stage]

    test "renders stage when data is valid", %{conn: conn, stage: %Stage{id: id} = stage} do
      conn = put(conn, Routes.stage_path(conn, :update, stage), stage: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.stage_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, stage: stage} do
      conn = put(conn, Routes.stage_path(conn, :update, stage), stage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stage" do
    setup [:create_stage]

    test "deletes chosen stage", %{conn: conn, stage: stage} do
      conn = delete(conn, Routes.stage_path(conn, :delete, stage))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.stage_path(conn, :show, stage))
      end
    end
  end

  defp create_stage(_) do
    stage = stage_fixture()
    %{stage: stage}
  end
end
