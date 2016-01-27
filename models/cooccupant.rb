class Cooccupant
  ATTRIBUTES = [
    :id,
    :applicant,
    :created,
    :occupant,
    :person,
    :relationship
  ].freeze

  attr_accessor *ATTRIBUTES
end
