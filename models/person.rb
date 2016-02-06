class Person < BaseModel
  ATTRIBUTES = [
    :id,
    :accounts_with_access,
    :birthdate,
    :created,
    :date_to_delete_identifying_info,
    :ethnicities,
    :emails,
    :gender,
    :name,
    :notes,
    :notifications,
    :other_ethnicity,
    :phones,
    :positions,
    :preferred_email,
    :preferred_phone
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'persons'
    end
  end
end
