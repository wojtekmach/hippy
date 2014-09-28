use Mix.Config

config :phoenix, Hippy.Router,
  port: System.get_env("PORT") || 4001,
  ssl: false,
  cookies: true,
  session_key: "_hippy_key",
  session_secret: "#WF12S8EY*K_L1E#PGKU@IQF@XD3LV()P1X2PC2WVD!JDZ*71_=X=+R8%X2K1BVL1Y5BX*2"

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


