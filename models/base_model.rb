module HonestRenter
  class BaseModel
    def initialize(data)
      data.each do |key, value|
        snaked = HonestRenter.snake_case(key)
        if self.respond_to?(snaked)
          send(:"#{snaked}=", value)
        end
      end
    end

    def to_h
      {}.tap do |hash|
        instance_variables.each do |variable|
          name = variable.to_s[1..-1]
          value = instance_variable_get(variable)
          hash[name] = value
        end
      end
    end

    class << self
      def find_all(session, limit=nil, offset=nil)
        args = [session, limit, offset].compact
        response = HonestRenter::FindAll.new(attr_name, *args).call
        raise response.error unless response.success?
        initialize_all_from_response(response)
      end

      def find(id, session)
        response = HonestRenter::FindById.new(id, attr_name, session).call
        raise response.error unless response.success?
        new(response.body["data"])
      end

      def find_all_by_filters(filters, session)
        request = HonestRenter::FindAllByFilter.new(attr_name, session)
        filters.each { |filter| request.add_filter(filter) }
        response = request.call

        raise response.error unless response.success?
        initialize_all_from_response(response)
      end

      private

      def initialize_all_from_response(response)
        response.body['data'].map do |data|
          new(data)
        end
      end
    end
  end

  private_constant :BaseModel
end
