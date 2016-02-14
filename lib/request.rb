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
        'Accept' => 'Application/vnd.honestrenter.v1+json'
      }.tap do |_headers|
        unless @session.nil?
          _headers['HONR-Session'] = @session.honr_session
          _headers['HONR-Authentication-Token'] = @session.honr_authentication_token
        end
      end
    end

    def get(url, query_params = {})
      raw_response = client.connection.get("#{BASE_URL}#{url}?apiKey=#{api_key}") do |request|
        request.headers = headers
      end

      respond(raw_response)
    end

    def post(url, body, query_params = {})
      raw_response = client.connection.post("#{BASE_URL}#{url}", post_body(body.merge(apiKey: api_key))) do |request|
        request.headers = headers
      end

      respond(raw_response)
    end

    private

    def respond(raw_response)
      response = Response.new(raw_response)

      raise response.error unless response.success?

      response
    end

    def post_body(hash)
      hash.map { |k, v| "#{k}=#{v}" }.join('&')
    end

    def api_key
      ENV['HONEST_RENTER_API_KEY']
    end
  end
end
