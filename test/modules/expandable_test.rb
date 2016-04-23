require_relative '../test_helper'
require_relative '../../modules/expandable'

module HonestRenter
  class ExpandableTest < MiniTest::Unit::TestCase

    class ExampleExpandableClass
      include Expandable
    end

    def setup
      @subject = ExampleExpandableClass.new
    end

    def test_included_methods
      assert_equal(true, @subject.respond_to?(:expanding))
    end

    def test_adding_to_array
      assert_equal(nil, @subject.instance_variable_get(:@expansions))

      test_value = 'something'
      @subject.expanding(test_value)
      assert_equal([test_value], @subject.instance_variable_get(:@expansions))

      another_test_value = 'something_else'
      @subject.expanding(another_test_value)
      assert_equal([test_value, another_test_value],
                   @subject.instance_variable_get(:@expansions))
    end
  end
end
