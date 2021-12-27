defmodule App.MediaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Media` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{

      })
      |> App.Media.create_image()

    image
  end
end
