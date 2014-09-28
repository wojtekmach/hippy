defmodule Hippy.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: '/ws'

  get "/", Hippy.PageController, :index, as: :pages

  channel "rooms", Hippy.Channels.Rooms

end
