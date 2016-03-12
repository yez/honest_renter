module HonestRenter
  class FindAll
    def initialize(resource_name, session)
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
      request = HonestRenter::Request.new(client, session)
      query = {}.tap do |params|
        params[:expand] = JSON(@expansions) unless @expansions.empty?
      end

      request.get(@resource_name, query)
    end
  end
end
