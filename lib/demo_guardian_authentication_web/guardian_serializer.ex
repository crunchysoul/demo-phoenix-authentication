defmodule GuardianSerializer do
  @behaviour Guardian.Serializer

  alias DemoGuardianAuthentication.Repo
  alias DemoGuardianAuthentication.Account.User

  def for_token(user) do
    case user do
      %User{} ->
        {:ok, "User: #{user.id}"}

      _ ->
        {:error, "Unknown resource type"}
    end
  end

  def from_token(token) do
    case token do
      "User:" <> id ->
        {:ok, Repo.get(User, id)}

      _ ->
        {:error, "Unknown resource type"}
    end
  end

  # def for_token(user = %User{}), do: {:ok, "User:#{user.id}"}
  # def for_token(_), do: {:error, "Unknown resource type"}
  #
  # def from_token("User:" <> id), do: {:ok, Repo.get(User, id)}
  # def from_token(_), do: {:error, "Unknown resource type"}
end
