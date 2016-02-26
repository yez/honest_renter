module HonestRenter
  class FindById
    def initialize(id, resource_name, session)
      @id = id
      @resource_name = resource_name
      @session = session
    end

    def expanding(attribute)
      @expansions ||= []
      @expansions << attribute

      self
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, @session)
      url = "#{ @resource_name }/#{ @id }"

      query = {}.tap do |params|
        params[:expand] = JSON(@expansions) unless @expansions.empty?
      end

      request.get(url, query)
    end
  end
end
