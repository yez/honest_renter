module HonestRenter
  class Session
    attr_reader :honr_authentiation_token, :honr_session

    def initialize(honr_authentiation_token, honr_session)
      @honr_authentiation_token = honr_authentiation_token
      @honr_session = honr_session
    end
  end
end
