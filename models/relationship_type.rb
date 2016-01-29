class RelationshipType
  ATTRIBUTES = [
    :id,
    :converse,
    :label
  ].freeze

  attr_accessor *ATTRIBUTES
end
