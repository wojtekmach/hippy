require 'minitest/autorun'
require 'net/http'
require 'capybara'

class Server
  attr_reader :port
  attr_reader :pid

  def start
    @port = find_available_port
    @pid = Process.spawn({"PORT" => port.to_s}, "mix phoenix.start")

    wait_until_responsive
  end

  def stop
    Process.kill("SIGTERM", pid)
  end

  def uri
    URI("http://127.0.0.1:#@port/")
  end

  private

  def wait_until_responsive
    Timeout.timeout(10) {
      loop do
        break if responsive?
        sleep 0.1
      end
    }
  end

  def responsive?
    r = Net::HTTP.get_response(uri)
    fail r.inspect if r.code != '200'
    true
  rescue SystemCallError, SocketError
    false
  end

  def find_available_port
    server = TCPServer.new('127.0.0.1', 0)
    server.addr[1]
  ensure
    server.close if server
  end
end

Capybara.register_driver :chrome do |app|
   Capybara::Selenium::Driver.new(app, browser: :chrome)
end

class Hippy
  Capybara.current_driver = :chrome
  include Capybara::DSL

  def initialize(uri)
    visit uri
  end

  def username=(new_username)
    fill_in "username-input", with: new_username
  end

  def say(message)
    fill_in "message-input", with: message + "\n"
  end

  def messages
    all("#messages li").map(&:text)
  end
end


system "rm -rf _build/dev/lib/hippy/"
$server = Server.new
$server.start

Minitest.after_run {
  $server.stop
}

describe 'Hippy' do
  it do
    hippy = Hippy.new($server.uri)
    hippy.username = 'wojtek'

    hippy.say "hello!"
    assert hippy.page.has_content?("[wojtek] hello!"), message { "Expected something, got: " + hippy.messages.inspect }
  end
end

