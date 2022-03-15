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
end
