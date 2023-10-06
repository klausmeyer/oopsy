require "rackup"
require "rack/handler/puma"

require "net/http"
require "timeout"

module RackServer
  def local_server_start
    Thread.new do
      Rackup::Handler::Puma.run(
        Rails.application,
        Host:      "127.0.0.1",
        Port:      4000,
        Threads:   "0:4",
        Workers:   0,
        Daemonize: false,
        Silent:    true
      )
    end
  end

  def local_server_wait
    Timeout.timeout(5) do
      loop do
        Net::HTTP.get(URI("http://127.0.0.1:4000/ping"))
        break
      rescue Errno::EADDRNOTAVAIL
        sleep 1
      rescue Errno::ECONNREFUSED
        sleep 0.1
      end
    end
  end
end
