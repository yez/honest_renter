require_relative '../../test_helper'
require_relative '../../../lib/requests/post'

module HonestRenter
  class PostTest < Minitest::Unit::TestCase
    def setup
      @resource_name = 'some resource'
      @session = instance_double(Session)
      @body = {}
      @request = Post.new(@resource_name, @body, @session)
    end

    def test_ivars
      assert_equal(@resource_name, @request.instance_variable_get(:@resource_name))
      assert_equal(@body, @request.instance_variable_get(:@body))
      assert_equal(@session, @request.instance_variable_get(:@session))
    end

    def call_setup
      mock_client = instance_double(Client)
      mock_request = instance_double(Request)
      expect(Request)
        .to receive(:new)
        .with(instance_of(Client), @session) { mock_request }

      mock_request
    end

    def test_call
      mock_request = call_setup
      expect(mock_request)
        .to receive(:post)
        .with(@resource_name, {})

      @request.call
    end
  end
end
