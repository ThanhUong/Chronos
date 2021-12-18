alias App.Projects

["inquiry", "follow up", "meeting", "proposal sent", "proposal signed", "retainer paid", "planning", "completed", "archived"]
|> Enum.each(fn stage ->
  Projects.create_stage(%{name: stage})
end)
