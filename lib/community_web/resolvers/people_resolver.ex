defmodule CommunityWeb.PeopleResolver do

  alias CommunityWeb.Starwars

  def all(_root, _args, _info) do
    {:ok, Starwars.people}
  end

  def name(root, _args, _info) do
    {:ok, root["name"]}
  end

  def gender(root, _args, _info) do
    {:ok, root["gender"]}
  end

  def hair_color(root, _args, _info) do
    {:ok, root["hair_color"]}
  end

end