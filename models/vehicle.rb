class Vehicle
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
end
