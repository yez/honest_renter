module HonestRenter
  class Response
    attr_reader :raw_response

    HAPPY_STATUSES = [200, 300].freeze

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def status
      raw_response['status'].to_i
    end

    def success?
      HAPPY_STATUSES.include?(status.floor)
    end
  end
end
