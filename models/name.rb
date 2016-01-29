class Name
  ATTRIBUTES = [
    :title,
    :first,
    :middle,
    :last,
    :previous_last,
    :suffix
  ].freeze

  attr_accessor *ATTRIBUTES
end
