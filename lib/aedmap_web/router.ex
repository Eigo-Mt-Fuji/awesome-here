defmodule AedmapWeb.Router do
  use AedmapWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AedmapWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/locations", LocationController
    resources "/iam_heres", IamHereController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AedmapWeb do
  #   pipe_through :api
  # end
end
