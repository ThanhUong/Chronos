# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     App.Repo.insert!(%App.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

########################################
# PROJECT TYPES
########################################
Code.require_file("seeds/project_types.exs", __DIR__)

########################################
# LEAD SOURCES
########################################
Code.require_file("seeds/lead_sources.exs", __DIR__)

########################################
# STAGES
########################################
Code.require_file("seeds/stages.exs", __DIR__)
