class BaseModel

  def initialize(data)
    data.each do |key, value|
      snaked = snake_case(key)
      if self.respond_to?(snaked)
        send(:"#{snaked}=", value)
      end
    end
  end

  private

  def snake_case(key)
    key.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
  end

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
