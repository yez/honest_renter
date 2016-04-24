module HonestRenter
  class Client
    def initialize(faraday_adapter = Faraday.default_adapter)
      @faraday_adapter = faraday_adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.adapter(@faraday_adapter)
      end
    end
  end
end
