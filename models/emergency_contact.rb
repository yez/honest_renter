class EmergencyContact < BaseModel
  ATTRIBUTES = [
    :id,
    :candidate,
    :contact,
    :relationship
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'emergency_contacts'
    end
  end
end
