defmodule AppWeb.Router do
  use AppWeb, :router

  pipeline :api do
    plug Guardian.Plug.Pipeline,
      module: App.Guardian,
      error_handler: AppWeb.AuthErrorHandler

    plug :accepts, ["json"]
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.VerifyHeader, scheme: "Token"
  end

  pipeline :check_authenticated do
    plug Guardian.Plug.LoadResource, allow_blank: true
  end

  pipeline :require_authenticated do
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource, allow_blank: true
  end

  # required Authenticated
  scope "/api", AppWeb do
    pipe_through [:api, :require_authenticated]

    get "/user", UserController, :show
    put "/user", UserController, :update
    resources "/projects", ProjectController, except: [:new, :edit]
    resources "/project-types", ProjectTypeController, except: [:new, :edit]
    resources "/lead-sources", LeadSourceController, except: [:new, :edit]
  end

  # Not required Authenticated
  scope "/api", AppWeb do
    pipe_through [:api, :check_authenticated]

    post "/users/login", UserController, :login
    post "/users", UserController, :create
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: AppWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
