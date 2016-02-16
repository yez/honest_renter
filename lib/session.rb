module HonestRenter
  class Session
    attr_reader :honr_authentication_token, :honr_session

    def initialize(honr_authentication_token, honr_session)
      @honr_authentication_token = honr_authentication_token.to_s
      @honr_session = honr_session
    end
  end
end
