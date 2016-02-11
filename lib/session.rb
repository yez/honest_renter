module HonestRenter
  class Session
    attr_reader :honr_session, :honr_authentiation_token

    def initialize(honr_session, honr_authentiation_token)
      @honr_session = honr_session
      @honr_authentiation_token = honr_authentiation_token
    end
  end
end
