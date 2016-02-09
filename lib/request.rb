module HonestRenter
  class Request
    attr_reader :client, :session

    BASE_URL = 'https://honestrenter.com/api/'.freeze
    EXPIRES_LENGTH = 3600
    RENEWABLE_MULTIPLIER = 3

    def initialize(client, session)
      @client = client
      @session = session
    end

    def headers
      {
        'Accept' => 'Application/vnd.honestrenter.v1+json',
        'Content-Type' => 'Application/vnd.honestrenter.v1+json',
        'HONR-Session' => honr_session,
        'HONR-Authentication-Token' => honr_authentication_token
      }
    end

    def honr_session
      session.honr_session
    end

    def honr_authentication_token
      session.honr_authentication_token
    end

    def get(url, query_params = {})
      raw_response = client.connection.get(BASE_URL + url) do |request|
        request.headers = headers
      end

      raise response.error unless response.success?
      response
    end

    def post(url, body, query_params = {})
      response = respond(client.connection.post(url, body))
      raise response.error unless response.success?
      response
    end

    private

    def respond(raw_response)
      Response.new(raw_response)
    end
  end
end
