module HonestRenter
  class Post
    def initialize(resource_name, body, session)
      @resource_name = resource_name
      @body = body
      @session = session
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, @session)
      request.post(@resource_name, @body)
    end
  end
end
