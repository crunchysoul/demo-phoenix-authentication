defmodule DemoGuardianAuthenticationWeb.Auth do
  import Hasher
  alias DemoGuardianAuthentication.Account

  def login_by_username_and_password(username, password) do
    user =
      username
      |> Account.get_by()
  end

  def login_by_username_and_password(username, password) do
    case username
         |> Account.get_by() do
      nil ->
        {:error, :notfound}

      user ->
        case user.foo do
          () ->
            nil
        end
    end
  end
end
