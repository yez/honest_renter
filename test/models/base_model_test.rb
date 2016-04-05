require_relative '../test_helper'
require_relative '../../models/base_model'

module HonestRenter
  class TestModel < BaseModel
    attr_accessor :foo, :bar_baz, :qux

    class << self
      def attr_name
        'test'
      end
    end
  end

  class BaseModelTest < MiniTest::Unit::TestCase
    def setup
      @foo = :foo
      @bar_baz = :bar_baz
      @qux = :qux
      data_hash = { foo: @foo, barBaz: @bar_baz, qux: @qux }
      @test_model = TestModel.new(data_hash)
    end

    def test_initialize_sets_proper_attributes
      assert_equal(@test_model.foo, @foo)
      assert_equal(@test_model.bar_baz, @bar_baz)
      assert_equal(@test_model.qux, @qux)
    end

    def test_to_h
      expected_hash = { 'foo' => @foo, 'bar_baz' => @bar_baz, 'qux' => @qux }
      assert_equal(@test_model.to_h, expected_hash)
    end

    def test_find_all
      find_request = instance_double(HonestRenter::FindAll)
      response = instance_double(HonestRenter::Response, body: { 'data' => {} }, success?: true)
      session = instance_double(HonestRenter::Session, honr_session: '', honr_authentication_token: '')
      expect(HonestRenter::FindAll).to receive(:new).with(TestModel.attr_name, session) { find_request }
      expect(find_request).to receive(:call) { response }

      TestModel.find_all(session)
    end

    def test_find
      id = 1234
      find_request = instance_double(HonestRenter::FindById)
      response = instance_double(HonestRenter::Response, body: { 'data' => {} }, success?: true)
      session = instance_double(HonestRenter::Session, honr_session: '', honr_authentication_token: '')
      expect(HonestRenter::FindById).to receive(:new).with(id, TestModel.attr_name, session) { find_request }
      expect(find_request).to receive(:call) { response }

      TestModel.find(id, session)
    end

    def test_visibility
      assert_raises(NameError) do
        ::HonestRenter::BaseModel.new
      end
    end
  end
end
