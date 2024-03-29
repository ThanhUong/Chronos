defmodule AppWeb.UserController do
  use AppWeb, :controller

  alias App.Accounts
  alias App.Accounts.User

  import App.Guardian

  action_fallback AppWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      {:ok, token, _} = encode_and_sign(user)

      conn
      |> render("show.json", user: user, token: token)
    end
  end

  def show(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    {:ok, token, _} = encode_and_sign(user)
    render(conn, "show.json", user: user, token: token)
  end

  def update(conn, %{"user" => user_params}) do
    user = Guardian.Plug.current_resource(conn)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      {:ok, token, _} = encode_and_sign(user)
      render(conn, "show.json", user: user, token: token)
    end
  end

  def login(conn, %{"user" => %{"email" => email, "password" => password}}) do
    user = Accounts.get_user_by_email(email)

    case Bcrypt.check_pass(user, password, hash_key: :password) do
      {:error, msg} ->
        send_resp(conn, :unauthorized, msg)

      _ ->
        {:ok, token, _} = encode_and_sign(user)
        render(conn, "show.json", user: user, token: token)
    end
  end
end
