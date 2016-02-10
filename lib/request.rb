module HonestRenter
  class Request
    attr_reader :client, :session

    BASE_URL = 'https://honestrenter.com/api/'.freeze
    EXPIRES_LENGTH = 3600
    RENEWABLE_MULTIPLIER = 3

    def initialize(client, session = nil)
      @client = client
      @session = session
    end

    def headers
      {
        'Accept' => 'Application/vnd.honestrenter.v1+json',
        # 'Content-Type' => 'Application/vnd.honestrenter.v1+json',
        # 'HONR-Session' => honr_session,
        # 'HONR-Authentication-Token' => honr_authentication_token
      }
    end

    def honr_session
      session.honr_session
    end

    def honr_authentication_token
      session.honr_authentication_token
    end

    def get(url, query_params = {})
      client.connection.get("#{BASE_URL}#{url}?apiKey=#{api_key}") do |request|
        request.headers = headers
      end
    end

    def post(url, body, query_params = {})
      client.connection.post("#{BASE_URL}#{url}", post_body(body.merge(apiKey: api_key))) do |request|
        request.headers = headers
      end
    end

    private

    def post_body(hash)
      hash.map { |k, v| "#{k}=#{v}" }.join('&')
    end

    def api_key
      ENV['HONEST_RENTER_API_KEY']
    end

    def respond(raw_response)
      Response.new(raw_response)
    end
  end
end
