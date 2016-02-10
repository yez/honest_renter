module HonestRenter
  class Post
    def initialize(resource_name, body)
      @resource_name = resource_name
      @body = body
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client)
      request.post(@resource_name, @body)
    end
  end
end
