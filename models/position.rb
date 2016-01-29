class Position
  ATTRIBUTES = [
    :id,
    :annual_income,
    :created,
    :end_date,
    :organization,
    :person,
    :references,
    :start_date,
    :title
  ].freeze

  attr_accessor *ATTRIBUTES
end
