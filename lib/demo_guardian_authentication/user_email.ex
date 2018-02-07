defmodule DemoGuardianAuthentication.UserEmail do
  import Swoosh.Email

  def welcome(user) do
    new()
    |> to({user.name, user.email})
    |> from({"Guardian Authentication Demo App", "DemoGuardianAuthentication@gmail.com"})
    |> subject("Demo verification email")
    |> html_body(
      "<p>Thanks for signing up and please click the link to verify your email</p><a href=#>Verify address</a>"
    )
  end
end
