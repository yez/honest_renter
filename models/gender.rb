class Gender
  ATTRIBUTES = [
    :id,
    :label
  ].freeze

  attr_accessor *ATTRIBUTES
end
