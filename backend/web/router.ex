defmodule Chatty.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: '/ws'

  get "/", Chatty.PageController, :index, as: :pages

  channel "rooms", Chatty.Channels.Rooms

end
