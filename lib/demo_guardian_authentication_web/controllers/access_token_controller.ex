defmodule AccessTokenController do
  use DemoGuardianAuthenticationWeb, :controller

  alias DemoGuardianAuthentication.Account
  alias DemoGuardianAuthentication.Account.User

  action_fallback DemoGuardianAuthenticationWeb.FallBackController

  def verify_email(conn, %{"token" => token}) do
    user =
      token
      |> Account.get_by_token()

    case !!user do
      true ->
        with {:ok, %User{} = user} <- Account.verify_email(user)
        do
          conn
          |> put_status(200)
          |> render("verify_email.json", user: user)
        end

      false ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "invalid token"})
    end
  end
end
