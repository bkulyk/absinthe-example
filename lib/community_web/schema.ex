defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.PeopleResolver

  object :person do
    field :name, :string do
      resolve &PeopleResolver.name/3
    end

    field :gender, :string do
      resolve &PeopleResolver.gender/3
    end

    field :hair_color, :string do
      resolve &PeopleResolver.hair_color/3
    end
  end

  query do
    field :people, list_of(:person) do
      resolve &PeopleResolver.all/3
    end
  end

end