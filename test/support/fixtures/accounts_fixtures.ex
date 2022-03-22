defmodule App.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{

      })
      |> App.Accounts.create_user()

    user
  end

  @doc """
  Generate valid user attributes.
  """
  def valid_user_attrs(attrs \\ %{}) do
    attrs
    |> Enum.into(
        %{"username" => "test",
          "email" => "test@example.com",
          "password" => "test",
          "organization" => "Organization 1"
        }
      )
  end

  @doc """
  Generate invalid user attributes.
  """
  def invalid_user_attrs() do
    valid_user_attrs(
      %{"username" => nil}
    )
  end

  @doc """
  Generate update user attributes.
  """
  def update_user_attrs() do
    valid_user_attrs(
      %{"username" => "test2"}
    )
  end

  @doc """
  Generate a user with dependencies.
  """
  def user_fixture_with_dependencies(attrs \\ %{}) do
    valid_attrs = valid_user_attrs()
    {:ok, user} =
      attrs
      |> Enum.into(valid_attrs)
      |> App.Accounts.create_user()

    user
  end

  @doc """
  Generate a organization.
  """
  def organization_fixture(attrs \\ %{}) do
    {:ok, organization} =
      attrs
      |> Enum.into(%{

      })
      |> App.Accounts.create_organization()

    organization
  end

  @doc """
  Generate a role.
  """
  def role_fixture(attrs \\ %{}) do
    {:ok, role} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> App.Accounts.create_role()

    role
  end
end
