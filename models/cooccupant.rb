class Cooccupant < BaseModel
  ATTRIBUTES = [
    :id,
    :applicant,
    :created,
    :occupant,
    :person,
    :relationship
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'cooccupants'
    end
  end
end
