class Vehicle < BaseModel
  ATTRIBUTES = [
    :id,
    :created,
    :license_plate,
    :make,
    :model,
    :owner,
    :year
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'vehicles'
    end
  end
end
