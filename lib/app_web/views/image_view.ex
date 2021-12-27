defmodule AppWeb.ImageView do
  use AppWeb, :view
  alias AppWeb.ImageView
  alias App.FileImage

  def render("index.json", %{images: images}) do
    %{data: render_many(images, ImageView, "image.json")}
  end

  def render("show.json", %{image: image}) do
    %{data: render_one(image, ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{
      id: image.id,
      image: image.image,
      url: FileImage.url(image.image.file_name)
    }
  end
end
