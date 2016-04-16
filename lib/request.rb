module HonestRenter
  class Request
    class ExpiredSession < StandardError; end

    attr_reader :client, :session

    BASE_URL = 'https://honestrenter.com/api/'.freeze

    def initialize(client, session = nil)
      @client = client
      @session = session

      if !@session.nil? && session.expired?
        raise ExpiredSession, "session expired at: #{ session.expires_at }, please re-authenticate."
      end
    end

    def headers
      {
        'Accept' => 'Application/vnd.honestrenter.v1+json'
      }.tap do |_headers|
        unless @session.nil?
          _headers['HONR-Session'] = JSON(@session.honr_session)
          _headers['HONR-Authentication-Token'] = @session.honr_authentication_token
        end
      end
    end

    def get(url, query_params = {})
      raw_response = client.connection.get("#{BASE_URL}#{url}") do |request|
        request.headers = headers
        request.params['apiKey'] = api_key
        query_params.each_pair do |key, value|
          request.params[key] = value
        end
      end

      respond(raw_response)
    end

    def post(url, body, query_params = {})
      _body = post_body(body.merge(apiKey: api_key))

      raw_response = client.connection.post("#{BASE_URL}#{url}", _body) do |request|
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
