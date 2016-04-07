module HonestRenter
  class FindByFilter
    def initialize(resource_name, session)
      @resource_name = resource_name
      @session = session
    end

    def expanding(attribute)
      @expansions ||= []
      @expansions << attribute

      self
    end

    def add_filter(filter)
      @filters ||=[]
      @filters << filter

      self
    end

    def call
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, @session)
      query = {}.tap do |params|
        unless @expansions.nil? || @expansions.empty?
          params[:expand] = JSON(@expansions)
        end

        Array(@filters).each do |filter|
          params[filter.key] = filter.value
        end
      end

      request.get(@resource_name, query)
    end
  end
end
