defmodule App.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{

      })
      |> App.Projects.create_project()

    project
  end

  @doc """
  Generate a project_type.
  """
  def project_type_fixture(attrs \\ %{}) do
    {:ok, project_type} =
      attrs
      |> Enum.into(%{

      })
      |> App.Projects.create_project_type()

    project_type
  end

  @doc """
  Generate a stage.
  """
  def stage_fixture(attrs \\ %{}) do
    {:ok, stage} =
      attrs
      |> Enum.into(%{

      })
      |> App.Projects.create_stage()

    stage
  end

  @doc """
  Generate a workflow.
  """
  def workflow_fixture(attrs \\ %{}) do
    {:ok, workflow} =
      attrs
      |> Enum.into(%{

      })
      |> App.Projects.create_workflow()

    workflow
  end

  @doc """
  Generate a lead_source.
  """
  def lead_source_fixture(attrs \\ %{}) do
    {:ok, lead_source} =
      attrs
      |> Enum.into(%{

      })
      |> App.Projects.create_lead_source()

    lead_source
  end

  @doc """
  Generate a project_role.
  """
  def project_role_fixture(attrs \\ %{}) do
    {:ok, project_role} =
      attrs
      |> Enum.into(%{

      })
      |> App.Projects.create_project_role()

    project_role
  end
end
