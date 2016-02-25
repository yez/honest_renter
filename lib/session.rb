module HonestRenter
  class Session
    attr_reader :honr_authentication_token, :honr_session

    def initialize(honr_authentication_token, honr_session)
      @honr_authentication_token = honr_authentication_token.to_s
      @honr_session = JSON.parse(honr_session)
    end

    def expires_at
      return Time.now if @honr_session.nil?
      Time.at(@honr_session['expires'])
    end

    def expired?
      return true if @honr_session.nil? || !@honr_session.is_a?(Hash)
      expires_at < Time.now
    end
  end
end
