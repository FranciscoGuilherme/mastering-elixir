import Config

# Configure your database
config :discuss, Discuss.Repo,
  #username: "elixir",
  #password: "elixir",
  #database: "elixir",
  #hostname: "localhost",
  url: System.get_env("DATABASE_URL") |> String.replace("?", "dev"),
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :discuss, DiscussWeb.Endpoint,
  http: [port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "bqp4nKVMKBmztUThB0GYPf2+/vdeD7c+Sx4WsiFiO3yRFoCk2DAaeMA9Df3YzDHb",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

config :discuss, DiscussWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/discuss_web/(live|views)/.*(ex)$",
      ~r"lib/discuss_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
