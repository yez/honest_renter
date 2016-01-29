class Pet
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
end
