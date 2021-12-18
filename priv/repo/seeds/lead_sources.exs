alias App.Projects

["personal website", "google", "facebook", "instagram", "yelp", "source example", "vendor referral", "client referral", "other", "unknown"]
|> Enum.each(fn lead_source ->
  Projects.create_lead_source(%{name: lead_source})
end)
