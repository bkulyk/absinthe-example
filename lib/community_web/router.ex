defmodule CommunityWeb.Router do
  use CommunityWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  schema = File.read! './lib/community_web/schema.graphql'
  Apex.ap schema

  {:ok, blueprint} = Absinthe.Phase.Parse.run schema
  # Apex.ap blueprint
  # Enum.each blueprint.input.definitions, fn def ->
  #   Apex.ap def
  # end

  # Apex.ap CommunityWeb.Schema
  # {__absinthe_types__}
  x = %{__absinthe_types__: blueprint.input.definitions}

  IO.puts CommunityWeb.Schema

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CommunityWeb.Schema,
      interface: :advanced,
      adapter: Absinthe.Adapter.SnakeCase,
      context: %{pubsub: CommunityWeb.Endpoint}
  end


end