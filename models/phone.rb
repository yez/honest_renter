class Phone
  ATTRIBUTES = [
    :id,
    :country_code,
    :created,
    :extension,
    :flagged,
    :number,
    :formatted,
    :organization,
    :person,
    :type
  ].freeze

  attr_accessor *ATTRIBUTES
end
