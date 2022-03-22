defmodule AppWeb.UserControllerTest do
  use AppWeb.ConnCase

  import App.AccountsFixtures
  import App.Guardian

  alias App.Accounts.User

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # describe "index" do
  #   test "lists all user", %{conn: conn} do
  #     conn = get(conn, Routes.user_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      create_attrs = valid_user_attrs()
      conn = post(conn, Routes.user_path(conn, :create), user: create_attrs)
      assert %{"id" => id, "token" => token} = json_response(conn, 200)["user"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      invalid_attrs = invalid_user_attrs()
      conn = post(conn, Routes.user_path(conn, :create), user: invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "get current user" do
    setup [:create_user, :sign_in_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = _user} do
      conn = get(conn, Routes.user_path(conn, :show))

      assert %{"id" => ^id} = json_response(conn, 200)["user"]
    end
  end

  describe "update user" do
    setup [:create_user, :sign_in_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = _user} do
      update_attrs = update_user_attrs()
      conn = put(conn, Routes.user_path(conn, :update), user: update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["user"]

      conn = get(conn, Routes.user_path(conn, :show))

      assert %{"id" => ^id} = json_response(conn, 200)["user"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: _user} do
      invalid_attrs = invalid_user_attrs()
      conn = put(conn, Routes.user_path(conn, :update), user: invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  # describe "delete user" do
  #   setup [:create_user, :sign_in_user]

  #   test "deletes chosen user", %{conn: conn, user: user} do
  #     conn = delete(conn, Routes.user_path(conn, :delete, user))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.user_path(conn, :show, user))
  #     end
  #   end
  # end

  defp create_user(_) do
    user = user_fixture_with_dependencies()
    {:ok, user: user}
  end

  defp sign_in_user(%{conn: conn, user: user}) do
    {:ok, token, _claims} = encode_and_sign(user)
    conn = conn |> put_req_header("authorization", "Token #{token}")
    {:ok, user: user, conn: conn}
  end

end
