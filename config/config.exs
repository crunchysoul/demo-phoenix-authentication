# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo_guardian_authentication, ecto_repos: [DemoGuardianAuthentication.Repo]

# Configures the endpoint
config :demo_guardian_authentication, DemoGuardianAuthenticationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "i+/rTd3qT+4B+thJKwOkeUO0RSXflji1DMftMu4D4uXu+0ZDA9BlqIQEEbHAqXj6",
  render_errors: [view: DemoGuardianAuthenticationWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: DemoGuardianAuthentication.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Swoosh Mailgun
config :demo_guardian_authentication, DemoGuardianAuthentication.Mailer,
  adapter: Swoosh.Adapters.Mailgun,
  api_key: {:system, "MAILGUN_API_KEY"},
  domain: {:system, "MAILGUN_DOMAIN"}

# Guardian
config :guardian, DemoGuardianAuthentication.Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Demo Guardian Authentication",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: System.get_env("GUARDIAN_SECRET") || "key",
  serializer: DemoGuardianAuthenticationWeb.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
