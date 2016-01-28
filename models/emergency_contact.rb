class EmergencyContact
  ATTRIBUTES = [
    :id,
    :candidate,
    :contact,
    :relationship
  ].freeze

  attr_accessor *ATTRIBUTES
end
