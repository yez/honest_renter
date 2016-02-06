class Pet < BaseModel
  ATTRIBUTES = [
    :id,
    :age_category,
    :breed,
    :created,
    :other_type,
    :owner,
    :size,
    :type
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'pets'
    end
  end
end
