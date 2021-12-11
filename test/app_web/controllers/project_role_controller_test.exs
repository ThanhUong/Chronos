defmodule AppWeb.ProjectRoleControllerTest do
  use AppWeb.ConnCase

  import App.ProjectsFixtures

  alias App.Projects.ProjectRole

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all project_roles", %{conn: conn} do
      conn = get(conn, Routes.project_role_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create project_role" do
    test "renders project_role when data is valid", %{conn: conn} do
      conn = post(conn, Routes.project_role_path(conn, :create), project_role: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.project_role_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.project_role_path(conn, :create), project_role: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update project_role" do
    setup [:create_project_role]

    test "renders project_role when data is valid", %{conn: conn, project_role: %ProjectRole{id: id} = project_role} do
      conn = put(conn, Routes.project_role_path(conn, :update, project_role), project_role: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.project_role_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, project_role: project_role} do
      conn = put(conn, Routes.project_role_path(conn, :update, project_role), project_role: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete project_role" do
    setup [:create_project_role]

    test "deletes chosen project_role", %{conn: conn, project_role: project_role} do
      conn = delete(conn, Routes.project_role_path(conn, :delete, project_role))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.project_role_path(conn, :show, project_role))
      end
    end
  end

  defp create_project_role(_) do
    project_role = project_role_fixture()
    %{project_role: project_role}
  end
end
