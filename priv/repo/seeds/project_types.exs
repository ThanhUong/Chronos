alias App.Projects

["corporate", "design", "event", "family", "party", "social", "wedding", "other"]
|> Enum.each(fn type ->
  Projects.create_project_type(%{name: type})
end)
