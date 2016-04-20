require_relative '../test_helper'

module HonestRenter
  class HonestRenterTest < MiniTest::Unit::TestCase
    def test_snake_case
      input = 'SnakeCaseTest'
      expected = 'snake_case_test'

      assert_equal(expected, HonestRenter.snake_case(input))
    end
  end
end
