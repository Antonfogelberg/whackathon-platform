defmodule WhackathonPlatformWeb.Router do
  use WhackathonPlatformWeb, :router
  use Pow.Phoenix.Router
  use PowAssent.Phoenix.Router

  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {WhackathonPlatformWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Pow authentication
  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: WhackathonPlatformWeb.AuthErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
      error_handler: WhackathonPlatformWeb.AuthErrorHandler
  end

  # PowAssent for github login
  pipeline :skip_csrf_protection do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  scope "/" do
    pipe_through :skip_csrf_protection

    pow_assent_authorization_post_callback_routes()
  end

  scope "/" do
    pipe_through :browser

    pow_assent_routes()
    pow_extension_routes()
  end

  scope "/", WhackathonPlatformWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", WhackathonPlatformWeb do
    pipe_through [:browser, :not_authenticated]

    get "/signup", RegistrationController, :new, as: :signup
    post "/signup", RegistrationController, :create, as: :signup
    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
  end

  scope "/", WhackathonPlatformWeb do
    pipe_through [:browser, :protected]

    delete "/logout", SessionController, :delete, as: :logout

    resources "/users", UserController, only: [:show] do
      resources "/projects", ProjectController, only: [:create, :show]
    end

    resources "/projects", ProjectController, only: [:index]
    resources "/events", EventController
  end

  # Other scopes may use custom stacks.
  # scope "/api", WhackathonPlatformWeb do
  #   pipe_through :api
  # end

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
      pipe_through :browser
      live_dashboard "/dashboard", metrics: WhackathonPlatformWeb.Telemetry
      pow_routes()
    end
  end
end
