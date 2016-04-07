require_relative '../../test_helper'
require_relative '../../../lib/requests/find_all_by_filter'

module HonestRenter
  class FindAllByFilterTest < Minitest::Unit::TestCase
    def setup
      @id = 1234
      @resource_name = 'some resource'
      @session = instance_double(Session)
      @request = FindAllByFilter.new(@resource_name, @session)
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

    def test_add_filter
      some_filter = Filter.new('key', 'value')
      @request.add_filter(some_filter)
      assert_equal([some_filter], @request.instance_variable_get(:@filters))

      another_filter = Filter.new('another_key', 'another_value')
      @request.add_filter(another_filter)
      assert_equal([some_filter, another_filter], @request.instance_variable_get(:@filters))
    end

    def test_add_filter_contract
      assert_equal(@request, @request.add_filter(anything))
    end
  end
end
