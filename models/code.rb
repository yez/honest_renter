class Code < BaseModel
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

  class << self
    def attr_name
      'codes'
    end
  end
end
