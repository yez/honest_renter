class Child
  ATTRIBUTES = [
    :id,
    :age,
    :applicant,
    :created
  ].freeze

  attr_accessor *ATTRIBUTES
end
