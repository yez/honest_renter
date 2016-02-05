class Gender
  ATTRIBUTES = [
    :id,
    :label
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def find_all
      HonestRenter::FindAll.new('genders').call
    end

    def find(id)
      HonestRenter::FindById.new(id, 'genders').call
    end
  end
end
