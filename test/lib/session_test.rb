require_relative '../test_helper'
require_relative '../../lib/session'

module HonestRenter
  class SessionTest < MiniTest::Unit::TestCase
    def test_valid_json
      session = Session.new('', JSON({}))
      assert_equal({}, session.honr_session)
    end

    def test_invalid_json
      session = Session.new('', 1234)
      assert_equal(nil, session.honr_session)
    end

    def test_expires_at_when_nil_session
      session = Session.new('', nil)
      formatting = '%H:%M:%S'

      assert_equal(Time.now.strftime(formatting),
                   session.expires_at.strftime(formatting))
    end

    def test_expired_when_nil_session
      session = Session.new('', nil)

      assert_equal(true, session.expired?)
    end

    def test_expired_session_is_expired
      session = Session.new('',
                            JSON({ expires: Time.now.to_i - 180 }))

      assert_equal(true, session.expired?)
    end

    def test_expired_at
      expires_time = Time.now + 180
      session = Session.new('',
                            JSON({ expires: expires_time.to_i }))

      assert_equal(expires_time.to_s, session.expires_at.to_s)
    end
  end
end
