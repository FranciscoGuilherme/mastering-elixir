defmodule DiscussWeb.Router do
  use DiscussWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DiscussWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DiscussWeb do
    pipe_through :browser

    #get "/", TopicController, :index
    #get "/topics/new", TopicController, :new
    #post "/topics", TopicController, :create
    #get "/topics/:id/edit", TopicController, :edit
    #put "/topics/:id", TopicController, :update
    resources "/", TopicController
  end

  scope "/auth" do
    pipe_through :browser

    #/auth/github
    #/auth/github/callback
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DiscussWeb.Telemetry
    end
  end

  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
