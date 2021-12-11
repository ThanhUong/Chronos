defmodule App.ProjectsTest do
  use App.DataCase

  alias App.Projects

  describe "projects" do
    alias App.Projects.Project

    import App.ProjectsFixtures

    @invalid_attrs %{}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "project_types" do
    alias App.Projects.ProjectType

    import App.ProjectsFixtures

    @invalid_attrs %{}

    test "list_project_types/0 returns all project_types" do
      project_type = project_type_fixture()
      assert Projects.list_project_types() == [project_type]
    end

    test "get_project_type!/1 returns the project_type with given id" do
      project_type = project_type_fixture()
      assert Projects.get_project_type!(project_type.id) == project_type
    end

    test "create_project_type/1 with valid data creates a project_type" do
      valid_attrs = %{}

      assert {:ok, %ProjectType{} = project_type} = Projects.create_project_type(valid_attrs)
    end

    test "create_project_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project_type(@invalid_attrs)
    end

    test "update_project_type/2 with valid data updates the project_type" do
      project_type = project_type_fixture()
      update_attrs = %{}

      assert {:ok, %ProjectType{} = project_type} = Projects.update_project_type(project_type, update_attrs)
    end

    test "update_project_type/2 with invalid data returns error changeset" do
      project_type = project_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project_type(project_type, @invalid_attrs)
      assert project_type == Projects.get_project_type!(project_type.id)
    end

    test "delete_project_type/1 deletes the project_type" do
      project_type = project_type_fixture()
      assert {:ok, %ProjectType{}} = Projects.delete_project_type(project_type)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project_type!(project_type.id) end
    end

    test "change_project_type/1 returns a project_type changeset" do
      project_type = project_type_fixture()
      assert %Ecto.Changeset{} = Projects.change_project_type(project_type)
    end
  end

  describe "stages" do
    alias App.Projects.Stage

    import App.ProjectsFixtures

    @invalid_attrs %{}

    test "list_stages/0 returns all stages" do
      stage = stage_fixture()
      assert Projects.list_stages() == [stage]
    end

    test "get_stage!/1 returns the stage with given id" do
      stage = stage_fixture()
      assert Projects.get_stage!(stage.id) == stage
    end

    test "create_stage/1 with valid data creates a stage" do
      valid_attrs = %{}

      assert {:ok, %Stage{} = stage} = Projects.create_stage(valid_attrs)
    end

    test "create_stage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_stage(@invalid_attrs)
    end

    test "update_stage/2 with valid data updates the stage" do
      stage = stage_fixture()
      update_attrs = %{}

      assert {:ok, %Stage{} = stage} = Projects.update_stage(stage, update_attrs)
    end

    test "update_stage/2 with invalid data returns error changeset" do
      stage = stage_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_stage(stage, @invalid_attrs)
      assert stage == Projects.get_stage!(stage.id)
    end

    test "delete_stage/1 deletes the stage" do
      stage = stage_fixture()
      assert {:ok, %Stage{}} = Projects.delete_stage(stage)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_stage!(stage.id) end
    end

    test "change_stage/1 returns a stage changeset" do
      stage = stage_fixture()
      assert %Ecto.Changeset{} = Projects.change_stage(stage)
    end
  end

  describe "workflows" do
    alias App.Projects.Workflow

    import App.ProjectsFixtures

    @invalid_attrs %{}

    test "list_workflows/0 returns all workflows" do
      workflow = workflow_fixture()
      assert Projects.list_workflows() == [workflow]
    end

    test "get_workflow!/1 returns the workflow with given id" do
      workflow = workflow_fixture()
      assert Projects.get_workflow!(workflow.id) == workflow
    end

    test "create_workflow/1 with valid data creates a workflow" do
      valid_attrs = %{}

      assert {:ok, %Workflow{} = workflow} = Projects.create_workflow(valid_attrs)
    end

    test "create_workflow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_workflow(@invalid_attrs)
    end

    test "update_workflow/2 with valid data updates the workflow" do
      workflow = workflow_fixture()
      update_attrs = %{}

      assert {:ok, %Workflow{} = workflow} = Projects.update_workflow(workflow, update_attrs)
    end

    test "update_workflow/2 with invalid data returns error changeset" do
      workflow = workflow_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_workflow(workflow, @invalid_attrs)
      assert workflow == Projects.get_workflow!(workflow.id)
    end

    test "delete_workflow/1 deletes the workflow" do
      workflow = workflow_fixture()
      assert {:ok, %Workflow{}} = Projects.delete_workflow(workflow)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_workflow!(workflow.id) end
    end

    test "change_workflow/1 returns a workflow changeset" do
      workflow = workflow_fixture()
      assert %Ecto.Changeset{} = Projects.change_workflow(workflow)
    end
  end

  describe "lead_sources" do
    alias App.Projects.LeadSource

    import App.ProjectsFixtures

    @invalid_attrs %{}

    test "list_lead_sources/0 returns all lead_sources" do
      lead_source = lead_source_fixture()
      assert Projects.list_lead_sources() == [lead_source]
    end

    test "get_lead_source!/1 returns the lead_source with given id" do
      lead_source = lead_source_fixture()
      assert Projects.get_lead_source!(lead_source.id) == lead_source
    end

    test "create_lead_source/1 with valid data creates a lead_source" do
      valid_attrs = %{}

      assert {:ok, %LeadSource{} = lead_source} = Projects.create_lead_source(valid_attrs)
    end

    test "create_lead_source/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_lead_source(@invalid_attrs)
    end

    test "update_lead_source/2 with valid data updates the lead_source" do
      lead_source = lead_source_fixture()
      update_attrs = %{}

      assert {:ok, %LeadSource{} = lead_source} = Projects.update_lead_source(lead_source, update_attrs)
    end

    test "update_lead_source/2 with invalid data returns error changeset" do
      lead_source = lead_source_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_lead_source(lead_source, @invalid_attrs)
      assert lead_source == Projects.get_lead_source!(lead_source.id)
    end

    test "delete_lead_source/1 deletes the lead_source" do
      lead_source = lead_source_fixture()
      assert {:ok, %LeadSource{}} = Projects.delete_lead_source(lead_source)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_lead_source!(lead_source.id) end
    end

    test "change_lead_source/1 returns a lead_source changeset" do
      lead_source = lead_source_fixture()
      assert %Ecto.Changeset{} = Projects.change_lead_source(lead_source)
    end
  end

  describe "project_roles" do
    alias App.Projects.ProjectRole

    import App.ProjectsFixtures

    @invalid_attrs %{}

    test "list_project_roles/0 returns all project_roles" do
      project_role = project_role_fixture()
      assert Projects.list_project_roles() == [project_role]
    end

    test "get_project_role!/1 returns the project_role with given id" do
      project_role = project_role_fixture()
      assert Projects.get_project_role!(project_role.id) == project_role
    end

    test "create_project_role/1 with valid data creates a project_role" do
      valid_attrs = %{}

      assert {:ok, %ProjectRole{} = project_role} = Projects.create_project_role(valid_attrs)
    end

    test "create_project_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project_role(@invalid_attrs)
    end

    test "update_project_role/2 with valid data updates the project_role" do
      project_role = project_role_fixture()
      update_attrs = %{}

      assert {:ok, %ProjectRole{} = project_role} = Projects.update_project_role(project_role, update_attrs)
    end

    test "update_project_role/2 with invalid data returns error changeset" do
      project_role = project_role_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project_role(project_role, @invalid_attrs)
      assert project_role == Projects.get_project_role!(project_role.id)
    end

    test "delete_project_role/1 deletes the project_role" do
      project_role = project_role_fixture()
      assert {:ok, %ProjectRole{}} = Projects.delete_project_role(project_role)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project_role!(project_role.id) end
    end

    test "change_project_role/1 returns a project_role changeset" do
      project_role = project_role_fixture()
      assert %Ecto.Changeset{} = Projects.change_project_role(project_role)
    end
  end
end
