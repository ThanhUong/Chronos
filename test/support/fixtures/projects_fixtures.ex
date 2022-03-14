defmodule App.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Projects` context.
  """

  import App.AccountsFixtures

  @organization_attrs %{name: "Organization 1"}
  @lead_source_attrs %{name: "google"}
  @project_type_attrs %{name: "design"}

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
  Generate valid project attributes.
  """
  def valid_project_attrs(attrs \\ %{}) do
    organization = organization_fixture(@organization_attrs)
    workflow = workflow_fixture(%{organization_id: organization.id})
    stage = stage_fixture(%{name: "inquiry", order: 0, workflow_id: workflow.id})
    lead_source = lead_source_fixture(@lead_source_attrs)
    project_type = project_type_fixture(@project_type_attrs)

    attrs
    |> Enum.into(
        %{"name" => "Project 1",
          "project_type" => project_type.id,
          "lead_source_id" => lead_source.id,
          "stage_id" => stage.id,
          "organization_id" => organization.id
        }
      )
  end

  @doc """
  Generate invalid project attributes.
  """
  def invalid_project_attrs() do
    valid_project_attrs(
      %{"name" => nil,
        "project_type" => 1,
        "lead_source_id" => 1,
        "stage_id" => 1,
        "organization_id" => 1
      }
    )
  end

  @doc """
  Generate update project attributes.
  """
  def update_project_attrs() do
    valid_project_attrs(
      %{"name" => "Project 2",
        "project_type" => 1,
        "lead_source_id" => 1,
        "stage_id" => 1,
        "organization_id" => 1
      }
    )
  end

  @doc """
  Generate a project with dependencies.
  """
  def project_fixture_with_dependencies(attrs \\ %{}) do
    valid_attrs = valid_project_attrs()
    {:ok, project} =
      attrs
      |> Enum.into(valid_attrs)
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
  Generate valid stage attributes.
  """
  def valid_stage_attrs(attrs \\ %{}) do
    organization = organization_fixture(@organization_attrs)
    workflow = workflow_fixture(%{organization_id: organization.id})

    attrs
    |> Enum.into(
        %{"name" => "inquiry",
          "order" => 0,
          "workflow_id" => workflow.id
        }
      )
  end

  @doc """
  Generate invalid stage attributes.
  """
  def invalid_stage_attrs() do
    valid_project_attrs(
      %{"name" => nil,
        "order" => nil,
        "workflow_id" => nil
      }
    )
  end

  @doc """
  Generate update stage attributes.
  """
  def update_stage_attrs() do
    valid_project_attrs(
      %{"name" => "follow up",
        "order" => 1,
        "workflow_id" => 1
      }
    )
  end

  @doc """
  Generate a stage with dependencies.
  """
  def stage_fixture_with_dependencies(attrs \\ %{}) do
    valid_attrs = valid_stage_attrs()
    {:ok, stage} =
      attrs
      |> Enum.into(valid_attrs)
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
