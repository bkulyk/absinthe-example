defmodule CommunityWeb.Starwars do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://swapi.co/api"
  plug Tesla.Middleware.FollowRedirects
  plug Tesla.Middleware.JSON

  def people do
    get("/people?format=json").body["results"]
  end

end
