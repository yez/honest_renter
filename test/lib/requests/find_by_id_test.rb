require_relative '../../test_helper'
require_relative '../../../lib/requests/find_by_id'

module HonestRenter
  class FindByIdTest < Minitest::Unit::TestCase
    def setup
      super
      @id = 1234
      @resource_name = 'some resource'
      @session = instance_double(Session)
      @request = FindById.new(@id, @resource_name, @session)
    end

    def test_ivars
      assert_equal(@id, @request.instance_variable_get(:@id))
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
  end
end
