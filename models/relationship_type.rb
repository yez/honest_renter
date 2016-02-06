class RelationshipType < BaseModel
  ATTRIBUTES = [
    :id,
    :converse,
    :label
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'relationship_types'
    end
  end
end
