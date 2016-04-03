require_relative '../../test_helper'
require_relative '../../../lib/requests/find_all'

module HonestRenter
  class FindAllTest < Minitest::Unit::TestCase
    def setup
      super
      @resource_name = 'some resource'
      @session = instance_double(Session)
      @request = FindAll.new(@resource_name, @session)
    end

    def test_ivars
      assert_equal(@resource_name, @request.instance_variable_get(:@resource_name))
      assert_equal(@session, @request.instance_variable_get(:@session))
    end

    def test_expanding
      @request.expanding('some attribute')
      assert_equal(['some attribute'], @request.instance_variable_get(:@expansions))
      @request.expanding('another attribute')
      assert_equal(['some attribute', 'another attribute'], @request.instance_variable_get(:@expansions))
    end

    def test_expanding_contract
      assert_equal(@request, @request.expanding(anything))
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
        .to receive(:get)
        .with(@resource_name, {})

      @request.call
    end

    def test_call_with_expanding
      mock_request = call_setup
      expansions = ['foo', 'bar']
      expansions.each { |e| @request.expanding(e) }

      expect(mock_request)
        .to receive(:get)
        .with(@resource_name, { expand: JSON(expansions) })

      @request.call
    end
  end
end
