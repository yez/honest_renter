module HonestRenter
  class FindAll
    def initialize(resource_name)
      @resource_name = resource_name
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client)
      request.get(@resource_name)
    end
  end
end
