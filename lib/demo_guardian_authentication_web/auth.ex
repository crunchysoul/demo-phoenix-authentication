defmodule DemoGuardianAuthenticationWeb.Auth do
  import Hasher
  alias DemoGuardianAuthentication.Account

  def login_by_username_and_password(username, password) do
    user =
      username
      |> Account.get_by()

    case !!user do
      false ->
        {:error, :notfound}

      true ->
        case user.email_verified do
          true ->
            case check_password_hash(password, user.password_hash) do
              true -> {:ok, user}
              false -> {:error, :unauthorized}
            end

          _ ->
            {:error, :unauthorized}
        end
    end
  end
end
