class Reference
  ATTRIBUTES = [
    :id,
    :created,
    :person,
    :position,
    :relationship,
    :residence
  ].freeze

  attr_accessor *ATTRIBUTES
end
