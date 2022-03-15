defmodule AppWeb.ProjectControllerTest do
  use AppWeb.ConnCase

  import App.ProjectsFixtures
  import App.AccountsFixtures
  import App.Guardian

  alias App.Projects.Project

  setup %{conn: conn} do
    user = user_fixture_with_dependencies()
    {:ok, token, _claims} = encode_and_sign(user)
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("authorization", "Token #{token}")

    {:ok, conn: conn}
  end

  describe "index" do
    test "lists all projects", %{conn: conn} do
      conn = get(conn, Routes.project_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create project" do
    test "renders project when data is valid", %{conn: conn} do
      create_attrs = valid_project_attrs()
      conn = post(conn, Routes.project_path(conn, :create), project: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.project_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      invalid_attrs = invalid_project_attrs()
      conn = post(conn, Routes.project_path(conn, :create), project: invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update project" do
    setup [:create_project]

    test "renders project when data is valid", %{conn: conn, project: %Project{id: id} = project} do
      update_attrs = update_project_attrs()

      conn = put(conn, Routes.project_path(conn, :update, project), project: update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.project_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, project: project} do
      invalid_attrs = invalid_project_attrs()
      conn = put(conn, Routes.project_path(conn, :update, project), project: invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete project" do
    setup [:create_project]

    test "deletes chosen project", %{conn: conn, project: project} do
      conn = delete(conn, Routes.project_path(conn, :delete, project))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.project_path(conn, :show, project))
      end
    end
  end

  defp create_project(_) do
    project = project_fixture_with_dependencies()
    %{project: project}
  end
end
