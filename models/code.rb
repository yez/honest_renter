class Code
  ATTRIBUTES = [
    :id,
    :account,
    :administration,
    :applicant,
    :assessments,
    :created,
    :email,
    :expires,
    :location,
    :metadata,
    :person,
    :unit,
    :value
  ].freeze

  attr_accessor *ATTRIBUTES
end
