require_relative '../lib/honest_renter'
require 'minitest/autorun'
require 'rspec/mocks'
require 'webmock/minitest'

WebMock.disable_net_connect!

class WebMockingTest < MiniTest::Unit::TestCase
  TEST_MEMBER_ID = 'TYJH7ptuju'.freeze
  FIXTURES_DIR = "#{ File.dirname(__FILE__) }/fixtures/"

  def setup
    WebMock.stub_request(
      :get,
      "https://honestrenter.com/api/members/#{TEST_MEMBER_ID}?apiKey")
      .with(headers: headers)
      .to_return(
        status: 200,
        body: File.read("#{ FIXTURES_DIR }/members/find.json"),
        headers: {})
  end

  def test_session
    @test_session ||= HonestRenter::Session.new('sometoken',
                                                {
                                                  expires: Time.now.to_i + 86400
                                                }.to_json)
  end

  def headers
    {
       'Accept' => 'Application/vnd.honestrenter.v1+json',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Honr-Authentication-Token'=>'sometoken',
       'Honr-Session'=>test_session.honr_session.to_json,
       'User-Agent'=>'Ruby'
     }
  end
end

module MinitestRSpecMocksIntegration
  include ::RSpec::Mocks::ExampleMethods

  def before_setup
    ::RSpec::Mocks.setup
    super
  end

  def after_teardown
    super
    ::RSpec::Mocks.verify
  ensure
    ::RSpec::Mocks.teardown
  end
end

MiniTest::Unit::TestCase.send(:include, MinitestRSpecMocksIntegration)
