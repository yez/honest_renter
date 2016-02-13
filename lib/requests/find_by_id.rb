module HonestRenter
  class FindById
    def initialize(id, resource_name, session)
      @id = id
      @resource_name = resource_name
      @session = session
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, @session)
      url = "#{ @resource_name }/#{ @id }"
      request.get(url)
    end
  end
end
