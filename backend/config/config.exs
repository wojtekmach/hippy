# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, Hippy.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_hippy_key",
  session_secret: "#WF12S8EY*K_L1E#PGKU@IQF@XD3LV()P1X2PC2WVD!JDZ*71_=X=+R8%X2K1BVL1Y5BX*2",
  catch_errors: true,
  debug_errors: false,
  error_controller: Hippy.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
