defmodule App.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Projects.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias App.Projects.ProjectType

  @doc """
  Returns the list of project_types.

  ## Examples

      iex> list_project_types()
      [%ProjectType{}, ...]

  """
  def list_project_types do
    Repo.all(ProjectType)
  end

  @doc """
  Gets a single project_type.

  Raises `Ecto.NoResultsError` if the Project type does not exist.

  ## Examples

      iex> get_project_type!(123)
      %ProjectType{}

      iex> get_project_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_type!(id), do: Repo.get!(ProjectType, id)

  @doc """
  Creates a project_type.

  ## Examples

      iex> create_project_type(%{field: value})
      {:ok, %ProjectType{}}

      iex> create_project_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_type(attrs \\ %{}) do
    %ProjectType{}
    |> ProjectType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_type.

  ## Examples

      iex> update_project_type(project_type, %{field: new_value})
      {:ok, %ProjectType{}}

      iex> update_project_type(project_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_type(%ProjectType{} = project_type, attrs) do
    project_type
    |> ProjectType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_type.

  ## Examples

      iex> delete_project_type(project_type)
      {:ok, %ProjectType{}}

      iex> delete_project_type(project_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_type(%ProjectType{} = project_type) do
    Repo.delete(project_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_type changes.

  ## Examples

      iex> change_project_type(project_type)
      %Ecto.Changeset{data: %ProjectType{}}

  """
  def change_project_type(%ProjectType{} = project_type, attrs \\ %{}) do
    ProjectType.changeset(project_type, attrs)
  end

  alias App.Projects.Stage

  @doc """
  Returns the list of stages.

  ## Examples

      iex> list_stages()
      [%Stage{}, ...]

  """
  def list_stages do
    Repo.all(Stage)
  end

  @doc """
  Gets a single stage.

  Raises `Ecto.NoResultsError` if the Stage does not exist.

  ## Examples

      iex> get_stage!(123)
      %Stage{}

      iex> get_stage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stage!(id), do: Repo.get!(Stage, id)

  @doc """
  Creates a stage.

  ## Examples

      iex> create_stage(%{field: value})
      {:ok, %Stage{}}

      iex> create_stage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stage(attrs \\ %{}) do
    %Stage{}
    |> Stage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stage.

  ## Examples

      iex> update_stage(stage, %{field: new_value})
      {:ok, %Stage{}}

      iex> update_stage(stage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stage(%Stage{} = stage, attrs) do
    stage
    |> Stage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stage.

  ## Examples

      iex> delete_stage(stage)
      {:ok, %Stage{}}

      iex> delete_stage(stage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stage(%Stage{} = stage) do
    Repo.delete(stage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stage changes.

  ## Examples

      iex> change_stage(stage)
      %Ecto.Changeset{data: %Stage{}}

  """
  def change_stage(%Stage{} = stage, attrs \\ %{}) do
    Stage.changeset(stage, attrs)
  end

  alias App.Projects.Workflow

  @doc """
  Returns the list of workflows.

  ## Examples

      iex> list_workflows()
      [%Workflow{}, ...]

  """
  def list_workflows do
    Repo.all(Workflow)
  end

  @doc """
  Gets a single workflow.

  Raises `Ecto.NoResultsError` if the Workflow does not exist.

  ## Examples

      iex> get_workflow!(123)
      %Workflow{}

      iex> get_workflow!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workflow!(id), do: Repo.get!(Workflow, id)

  @doc """
  Creates a workflow.

  ## Examples

      iex> create_workflow(%{field: value})
      {:ok, %Workflow{}}

      iex> create_workflow(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workflow(attrs \\ %{}) do
    %Workflow{}
    |> Workflow.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a workflow.

  ## Examples

      iex> update_workflow(workflow, %{field: new_value})
      {:ok, %Workflow{}}

      iex> update_workflow(workflow, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workflow(%Workflow{} = workflow, attrs) do
    workflow
    |> Workflow.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a workflow.

  ## Examples

      iex> delete_workflow(workflow)
      {:ok, %Workflow{}}

      iex> delete_workflow(workflow)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workflow(%Workflow{} = workflow) do
    Repo.delete(workflow)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workflow changes.

  ## Examples

      iex> change_workflow(workflow)
      %Ecto.Changeset{data: %Workflow{}}

  """
  def change_workflow(%Workflow{} = workflow, attrs \\ %{}) do
    Workflow.changeset(workflow, attrs)
  end

  alias App.Projects.LeadSource

  @doc """
  Returns the list of lead_sources.

  ## Examples

      iex> list_lead_sources()
      [%LeadSource{}, ...]

  """
  def list_lead_sources do
    Repo.all(LeadSource)
  end

  @doc """
  Gets a single lead_source.

  Raises `Ecto.NoResultsError` if the Lead source does not exist.

  ## Examples

      iex> get_lead_source!(123)
      %LeadSource{}

      iex> get_lead_source!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lead_source!(id), do: Repo.get!(LeadSource, id)

  @doc """
  Creates a lead_source.

  ## Examples

      iex> create_lead_source(%{field: value})
      {:ok, %LeadSource{}}

      iex> create_lead_source(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lead_source(attrs \\ %{}) do
    %LeadSource{}
    |> LeadSource.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lead_source.

  ## Examples

      iex> update_lead_source(lead_source, %{field: new_value})
      {:ok, %LeadSource{}}

      iex> update_lead_source(lead_source, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lead_source(%LeadSource{} = lead_source, attrs) do
    lead_source
    |> LeadSource.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lead_source.

  ## Examples

      iex> delete_lead_source(lead_source)
      {:ok, %LeadSource{}}

      iex> delete_lead_source(lead_source)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lead_source(%LeadSource{} = lead_source) do
    Repo.delete(lead_source)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lead_source changes.

  ## Examples

      iex> change_lead_source(lead_source)
      %Ecto.Changeset{data: %LeadSource{}}

  """
  def change_lead_source(%LeadSource{} = lead_source, attrs \\ %{}) do
    LeadSource.changeset(lead_source, attrs)
  end

  alias App.Projects.ProjectRole

  @doc """
  Returns the list of project_roles.

  ## Examples

      iex> list_project_roles()
      [%ProjectRole{}, ...]

  """
  def list_project_roles do
    Repo.all(ProjectRole)
  end

  @doc """
  Gets a single project_role.

  Raises `Ecto.NoResultsError` if the Project role does not exist.

  ## Examples

      iex> get_project_role!(123)
      %ProjectRole{}

      iex> get_project_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_role!(id), do: Repo.get!(ProjectRole, id)

  @doc """
  Creates a project_role.

  ## Examples

      iex> create_project_role(%{field: value})
      {:ok, %ProjectRole{}}

      iex> create_project_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_role(attrs \\ %{}) do
    %ProjectRole{}
    |> ProjectRole.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_role.

  ## Examples

      iex> update_project_role(project_role, %{field: new_value})
      {:ok, %ProjectRole{}}

      iex> update_project_role(project_role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_role(%ProjectRole{} = project_role, attrs) do
    project_role
    |> ProjectRole.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_role.

  ## Examples

      iex> delete_project_role(project_role)
      {:ok, %ProjectRole{}}

      iex> delete_project_role(project_role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_role(%ProjectRole{} = project_role) do
    Repo.delete(project_role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_role changes.

  ## Examples

      iex> change_project_role(project_role)
      %Ecto.Changeset{data: %ProjectRole{}}

  """
  def change_project_role(%ProjectRole{} = project_role, attrs \\ %{}) do
    ProjectRole.changeset(project_role, attrs)
  end
end
