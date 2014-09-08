use Mix.Config

config :phoenix, Chatty.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_chatty_key",
  session_secret: "#WF12S8EY*K_L1E#PGKU@IQF@XD3LV()P1X2PC2WVD!JDZ*71_=X=+R8%X2K1BVL1Y5BX*2",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


