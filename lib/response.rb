module HonestRenter
  class Response
    class MalformedResponse < StandardError; end
    class RequestError < StandardError; end

    attr_reader :body, :headers, :error

    HAPPY_STATUSES = [200, 300].freeze

    def initialize(raw_response)
      @status = raw_response.status
      @headers = raw_response.headers

      begin
        @body = JSON.parse(raw_response.body)
      rescue JSON::ParserError, TypeError => e
        raise MalformedResponse,
                "Honest Renter response body not valid JSON, #{ raw_response.body } given"
      end

      if @body.key?('error')
        @error = RequestError.new(@body['error']['message'])
      end
    end

    def success?
      HAPPY_STATUSES.include?(@status.floor)
    end
  end
end
