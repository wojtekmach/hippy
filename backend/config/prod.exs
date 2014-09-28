use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, Hippy.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_hippy_key",
  session_secret: "#WF12S8EY*K_L1E#PGKU@IQF@XD3LV()P1X2PC2WVD!JDZ*71_=X=+R8%X2K1BVL1Y5BX*2"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

