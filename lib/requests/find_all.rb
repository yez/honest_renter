module HonestRenter
  class FindAll
    def initialize(resource_name, session)
      @resource_name = resource_name
      @session = session
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, session)
      request.get(@resource_name)
    end
  end
end
