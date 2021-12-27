defmodule App.Media.Image do
  use Ecto.Schema
  use  Waffle.Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :image, App.FileImage.Type

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast_attachments(attrs, [:image])
    |> validate_required([:image])
  end
end
