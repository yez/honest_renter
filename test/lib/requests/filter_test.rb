require_relative '../../test_helper'
require_relative '../../../lib/requests/filter'

module HonestRenter
  class FilterTest < MiniTest::Unit::TestCase
    def test_instance_variables
      key = 'some key'
      value = 'some value'
      filter = Filter.new(key, value)
      assert_equal(key, filter.key)
      assert_equal(value, filter.value)
    end
  end
end
