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

    private

    class << self
      def find_all(session)
        HonestRenter::FindAll.new(attr_name).call
      end

      def find(id, session)
        response = HonestRenter::FindById.new(id, attr_name, session).call
        new(response.body["data"])
      end
    end
  end
end
