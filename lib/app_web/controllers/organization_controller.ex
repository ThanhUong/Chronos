defmodule AppWeb.OrganizationController do
  use AppWeb, :controller

  alias App.Accounts
  alias App.Accounts.Organization

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    organizations = Accounts.list_organizations()
    render(conn, "index.json", organizations: organizations)
  end

  def create(conn, %{"organization" => organization_params}) do
    with {:ok, %Organization{} = organization} <- Accounts.create_organization(organization_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.organization_path(conn, :show, organization))
      |> render("show.json", organization: organization)
    end
  end

  def show(conn, %{"id" => id}) do
    organization = Accounts.get_organization!(id)
    render(conn, "show.json", organization: organization)
  end

  def show_user_organizations(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    organizations = Accounts.list_organizations_of_user(user)
    render(conn, "index_without_users.json", organizations: organizations)
  end

  def update(conn, %{"id" => id, "organization" => organization_params}) do
    organization = Accounts.get_organization!(id)

    with {:ok, %Organization{} = organization} <- Accounts.update_organization(organization, organization_params) do
      render(conn, "show.json", organization: organization)
    end
  end

  def delete(conn, %{"id" => id}) do
    organization = Accounts.get_organization!(id)

    with {:ok, %Organization{}} <- Accounts.delete_organization(organization) do
      send_resp(conn, :no_content, "")
    end
  end
end
