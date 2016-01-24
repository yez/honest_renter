module HonestRenter
  class Client
    def initialize(faraday_adapter = Faraday.default_adapter)
      @faraday_adapter = faraday_adapter
    end

    private

    def connection
      @connection ||= Faraday.new do |conn|
        conn.adapter @faraday_adapter
      end
    end
  end
end
