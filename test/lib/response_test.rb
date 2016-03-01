require_relative '../test_helper'
require 'minitest/autorun'
require_relative '../../lib/response'

module HonestRenter
  class ResponseTest < MiniTest::Unit::TestCase
    class FakeResponse
      attr_reader :status, :headers, :body

      def initialize(status, headers, body)
        @status = status
        @headers = headers
        @body = body
      end
    end

    def test_successful_response_is_not_error
      happy_response = Response.new(
                        FakeResponse.new(
                            200,
                            {},
                            JSON({ data: 'this is some data' })
                        )
                      )
      assert_equal true, happy_response.success?
    end

    def test_errorful_response_is_error
      sad_response = Response.new(
                        FakeResponse.new(
                            500,
                            {},
                            JSON({ error: { message: 'this is an error' } })
                        )
                      )
      assert_equal false, sad_response.success?
      assert_equal 'this is an error', sad_response.error.to_s
    end

    def test_malformed_json_raises_error
      assert_raises(Response::MalformedResponse) do
        invalid_response = FakeResponse.new(200, {}, 1234)
        Response.new(invalid_response)
      end
    end
  end
end
