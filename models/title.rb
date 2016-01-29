class Title
  ATTRIBUTES = [
    :id,
    :gender,
    :acronym
  ].freeze

  attr_accessor *ATTRIBUTES
end
