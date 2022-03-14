defmodule App.AccountsTest do
  use App.DataCase

  alias App.Accounts

  describe "organizations" do
    alias App.Accounts.Organization

    import App.AccountsFixtures

    @valid_attrs %{name: "Organization 1"}
    @update_attrs %{name: "Organization 2"}
    @invalid_attrs %{name: nil}

    test "list_organizations/0 returns all organizations" do
      organization = organization_fixture(@valid_attrs)
      assert Accounts.list_organizations() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture(@valid_attrs)
      assert Accounts.get_organization_without_users!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      assert {:ok, %Organization{} = _organization} = Accounts.create_organization(@valid_attrs)
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture(@valid_attrs)
      assert {:ok, %Organization{} = _organization} = Accounts.update_organization(organization, @update_attrs)
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture(@valid_attrs)
      assert {:error, %Ecto.Changeset{}} = Accounts.update_organization(organization, @invalid_attrs)
      assert organization == Accounts.get_organization_without_users!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture(@valid_attrs)
      assert {:ok, %Organization{}} = Accounts.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture(@valid_attrs)
      assert %Ecto.Changeset{} = Accounts.change_organization(organization)
    end
  end
end
