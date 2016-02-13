class BaseModel
  class << self
    def find_all(session)
      HonestRenter::FindAll.new(attr_name).call
    end

    def find(id, session)
      HonestRenter::FindById.new(id, attr_name, session).call
    end
  end
end
