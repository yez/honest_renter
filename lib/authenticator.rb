module HonestRenter
  class Authenticator
    class << self
      def from_secret_key(secret_key)
        SecretKeyAuthenticator.new(secret_key)
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

  class SecretKeyAuthenticator < Authenticator
    def after_initialize(secret_key)
      @secret_key = secret_key
    end

    def build_session

    end
  end

  class AddressPasswordAuthenticator < Authenticator
    def after_initialize(address, password)
      @address = address
      @password = password
    end

    def build_session
      raw_session = HonestRenter::Post.new('members/session', address: address, password: password).call
    end
  end
end
