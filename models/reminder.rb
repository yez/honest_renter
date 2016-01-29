class Reminder
  ATTRIBUTES = [
    :id,
    :applicant,
    :created,
    :destination,
    :sender
  ].freeze

  attr_accessor *ATTRIBUTES
end
