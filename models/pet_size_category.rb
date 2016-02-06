class PetSizeCategory < BaseModel
  ATTRIBUTES = [
    :id,
    :label
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'pet_size_categories'
    end
  end
end
