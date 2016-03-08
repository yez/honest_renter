require_relative '../test_helper'
require_relative '../../models/base_model'

module HonestRenter
  class TestModel < BaseModel
    attr_accessor :foo, :bar_baz, :qux
  end

  class BaseModelTest < MiniTest::Unit::TestCase
    def test_initialize_sets_proper_attributes
      foo = :foo
      bar_baz = :bar_baz
      qux = :qux
      data_hash = { foo: foo, barBaz: bar_baz, qux: qux }
      test_model = TestModel.new(data_hash)

      assert_equal(test_model.foo, foo)
      assert_equal(test_model.bar_baz, bar_baz)
      assert_equal(test_model.qux, qux)
    end
  end
end
