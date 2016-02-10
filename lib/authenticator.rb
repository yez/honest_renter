module HonestRenter
  class Authenticator
    class << self
      def from_secret_key(secret_key)
        SecretKeyAuthenticator.new(secret_key)
      end

      def from_username_password(username, password)
        UsernamePasswordAuthenticator.new(username, password)
      end
    end

    def initialize(*args)
      after_initialize(*args)
    end
  end

  class SecretKeyAuthenticator < Authenticator
    def after_initialize(secret_key)
      @secret_key = secret_key
    end
  end

  class UsernamePasswordAuthenticator < Authenticator
    def after_initialize(username, password)
      @username = username
      @password = password
    end
  end
end
