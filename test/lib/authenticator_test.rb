require_relative '../test_helper'
require_relative '../../lib/authenticator'

module HonestRenter
  class AuthenticatorTest < MiniTest::Unit::TestCase
    def test_from_secret_key_member_id
      secret_key = 'secret_key'
      member_id = 1234
      authenticator = Authenticator.from_secret_key_member_id(secret_key, member_id)
      assert_equal(authenticator.class, SecretKeyMemberIdAuthenticator)
      assert_equal(authenticator.instance_variable_get(:@secret_key), secret_key)
      assert_equal(authenticator.instance_variable_get(:@member_id), member_id)
    end

    def test_from_address_and_password
      address = 'address'
      password = 'a password'
      authenticator = Authenticator.from_address_and_password(address, password)
      assert_equal(authenticator.class, AddressPasswordAuthenticator)
      assert_equal(authenticator.instance_variable_get(:@address), address)
      assert_equal(authenticator.instance_variable_get(:@password), password)
    end
  end
end
