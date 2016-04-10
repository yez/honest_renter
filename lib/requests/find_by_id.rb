module HonestRenter
  class FindById
    include Expandable

    def initialize(id, resource_name, session)
      @id = id
      @resource_name = resource_name
      @session = session
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, @session)
      url = "#{ @resource_name }/#{ @id }"

      query = {}.tap do |params|
        params[:expand] = JSON(@expansions) unless Array(@expansions).empty?
      end

      request.get(url, query)
    end
  end
end
