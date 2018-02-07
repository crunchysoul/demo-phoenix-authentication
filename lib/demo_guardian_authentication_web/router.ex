defmodule DemoGuardianAuthenticationWeb.Router do
  use DemoGuardianAuthenticationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DemoGuardianAuthenticationWeb do
    pipe_through :api
  end
end
