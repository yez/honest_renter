require_relative '../test_helper'
require_relative '../../models/base_model'
require_relative '../../modules/unrequestable'

module HonestRenter
  class UnrequestableTest < MiniTest::Unit::TestCase

    class ExampleUnrequestableObject < BaseModel
      include Unrequestable
    end

    def test_included_methods_present
      assert_equal(true, ExampleUnrequestableObject.respond_to?(:find_all))
    end

    def test_raise_error
      assert_raises(Unrequestable::Unsupported) do
        ExampleUnrequestableObject.find_all
      end
    end
  end
end
