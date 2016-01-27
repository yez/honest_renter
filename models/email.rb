class Email
  ATTRIBUTES = [
    :id,
    :address,
    :confirmed,
    :created,
    :flagged,
    :organization,
    :person
  ].freeze

  attr_accessor *ATTRIBUTES
end
