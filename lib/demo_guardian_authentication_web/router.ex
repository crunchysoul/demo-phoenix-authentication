defmodule DemoGuardianAuthenticationWeb.Router do
  use DemoGuardianAuthenticationWeb, :router

  pipeline :api do
    plug(:accepts, ["json", "json-api"])
    plug(JaSerializer.Deserializer)
  end

  pipeline :api_auth do
    plug(:accepts, ["json", "json-api"])
    plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
    plug(Guardian.Plug.LoadResource)
    plug(JaSerializer.Deserializer)
  end

  scope "/", DemoGuardianAuthenticationWeb do
    pipe_through(:api)

    get("/", PageController, :index)
  end

  scope "v1/api/auth", DemoGuardianAuthenticationWeb do
    pipe_through(:api)

    get("/verify_email/:token", AccessTokenController, :verify_email)
  end
end
