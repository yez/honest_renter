class PetType < BaseModel
  ATTRIBUTES = [
    :id,
    :label
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'pet_types'
    end
  end
end
