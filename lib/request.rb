module HonestRenter
  class Request
    attr_reader :client, :person_id

    BASE_URL = 'https://honestrenter.com/api/'.freeze
    EXPIRES_LENGTH = 3600
    RENEWABLE_MULTIPLIER = 3

    def initialize(client, person_id)
      @client = client
      @person_id = person_id
    end

    def headers
      json_session_hash = JSON(session_hash)

      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
        'HONR-Session' => json_session_hash,
        'HONR-Authentication-Token' => Digest::SHA256.digest(json_session_hash)
      }
    end

    def session_hash
      now = Time.now.to_i

      {
        apiKey: ENV['HONEST_RENTER_API_KEY'],
        authorization: 'member',
        expires: now + EXPIRES_LENGTH,
        person: person_id,
        renewableUntil: now + (EXPIRES_LENGTH * RENEWABLE_MULTIPLIER)
       }
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
