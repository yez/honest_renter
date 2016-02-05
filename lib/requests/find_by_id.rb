module HonestRenter
  class FindById
    def initialize(id, resource_name)
      @id = id
      @resource_name = resource_name
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, '')
      url = "#{ @resource_name }/#{ @id }"
      request.get(url)
    end
  end
end
