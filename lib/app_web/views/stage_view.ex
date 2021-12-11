defmodule AppWeb.StageView do
  use AppWeb, :view
  alias AppWeb.StageView

  def render("index.json", %{stages: stages}) do
    %{data: render_many(stages, StageView, "stage.json")}
  end

  def render("show.json", %{stage: stage}) do
    %{data: render_one(stage, StageView, "stage.json")}
  end

  def render("stage.json", %{stage: stage}) do
    %{
      id: stage.id
    }
  end
end
