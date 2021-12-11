defmodule AppWeb.LeadSourceControllerTest do
  use AppWeb.ConnCase

  import App.ProjectsFixtures

  alias App.Projects.LeadSource

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all lead_sources", %{conn: conn} do
      conn = get(conn, Routes.lead_source_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create lead_source" do
    test "renders lead_source when data is valid", %{conn: conn} do
      conn = post(conn, Routes.lead_source_path(conn, :create), lead_source: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.lead_source_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.lead_source_path(conn, :create), lead_source: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update lead_source" do
    setup [:create_lead_source]

    test "renders lead_source when data is valid", %{conn: conn, lead_source: %LeadSource{id: id} = lead_source} do
      conn = put(conn, Routes.lead_source_path(conn, :update, lead_source), lead_source: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.lead_source_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, lead_source: lead_source} do
      conn = put(conn, Routes.lead_source_path(conn, :update, lead_source), lead_source: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete lead_source" do
    setup [:create_lead_source]

    test "deletes chosen lead_source", %{conn: conn, lead_source: lead_source} do
      conn = delete(conn, Routes.lead_source_path(conn, :delete, lead_source))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.lead_source_path(conn, :show, lead_source))
      end
    end
  end

  defp create_lead_source(_) do
    lead_source = lead_source_fixture()
    %{lead_source: lead_source}
  end
end
