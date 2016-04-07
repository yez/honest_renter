module HonestRenter
  class FindAllByFilter
    def initialize(resource_name, session, limit = nil, offset = nil)
      @resource_name = resource_name
      @session = session
      @limit = limit
      @offset = offset
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

        params[:limit] = @limit unless @limit.nil?
        params[:offset] = @offset unless @offset.nil?
      end

      request.get(@resource_name, query)
    end
  end
end
