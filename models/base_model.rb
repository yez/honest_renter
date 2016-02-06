class BaseModel
  class << self
    def find_all
      HonestRenter::FindAll.new(attr_name).call
    end

    def find(id)
      HonestRenter::FindById.new(id, attr_name).call
    end
  end
end
