defmodule Chatty.Channels.Rooms do
  use Phoenix.Channel

  def join(socket, topic = "lobby", message) do
    IO.puts "JOIN: #{socket.channel}:#{topic}"
    username = message["message"] || "anon"

    reply     socket, "user:entered", %{username: username}
    broadcast socket, "user:entered", %{username: username}
    {:ok, socket}
  end

  def join(socket, _topic, _message) do
    {:error, socket, :unauthorized}
  end

  def event(socket, "new:message", message) do
    broadcast socket, "new:message", message
    socket
  end
end
