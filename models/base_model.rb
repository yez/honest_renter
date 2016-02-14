class BaseModel

  def initialize(data)
    data.each do |key, value|
      if self.respond_to?(key)
        send(:"#{key}=", value)
      end
    end
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
