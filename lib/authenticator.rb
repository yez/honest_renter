module HonestRenter
  class Authenticator
    class << self
      def from_secret_key_member_id(secret_key, member_id)
        SecretKeyMemberIdAuthenticator.new(secret_key, member_id)
      end

      def from_address_and_password(address, password)
        AddressPasswordAuthenticator.new(address, password)
      end
    end

    def initialize(*args)
      after_initialize(*args)
    end

    def session
      @session ||= build_session
    end

    def renew!
      @session = nil
      session
    end
  end

  class SecretKeyMemberIdAuthenticator < Authenticator
    require 'openssl'

    ONE_HOUR = 3600

    def after_initialize(secret_key, member_id)
      @secret_key = secret_key
      @member_id = member_id
    end

    def build_session
      json_hash = JSON(raw_hash)
      digest = OpenSSL::Digest.new('sha256')
      encoded = OpenSSL::HMAC.hexdigest(digest, @secret_key, json_hash)

      HonestRenter::Session.new(encoded, json_hash)
    end

    def raw_hash
      now = Time.now

      {
        apiKey: ENV['HONEST_RENTER_API_KEY'],
        authorization: 'member',
        expires: now.to_i + ONE_HOUR,
        person: @member_id,
        renewableUntil: now.to_i + (3 * ONE_HOUR)
      }
    end
  end

  class AddressPasswordAuthenticator < Authenticator
    def after_initialize(address, password)
      @address = address
      @password = password
    end

    def build_session
      raw_session = HonestRenter::Post.new('members/session',
                                           address: @address,
                                           password: @password)
                                      .call

      HonestRenter::Session.new(
        raw_session.headers['honr-authentication-token'],
        raw_session.headers['honr-session']
      )
    end
  end
end
