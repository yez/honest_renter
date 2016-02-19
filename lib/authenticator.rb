module HonestRenter
  class Authenticator
    class << self
      def from_secret_key_member_id(*_)
        raise 'secret key auth is not supported at this time'
      end

      def from_address_and_password(address, password)
        AddressPasswordAuthenticator.new(address, password)
      end
    end

    def initialize(*args)
      after_initialize(*args)
    end

    def session
      build_session
    end
  end

  class AddressPasswordAuthenticator < Authenticator
    def after_initialize(address, password)
      @address = address
      @password = password
    end

    def build_session
      raw_session = HonestRenter::Post.new('members/session', address: @address, password: @password).call

      HonestRenter::Session.new(
        raw_session.headers['honr-authentication-token'],
        raw_session.headers['honr-session']
      )
    end
  end
end
