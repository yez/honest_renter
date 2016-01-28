class InviteSettings
  ATTRIBUTES = [
    :id,
    :account,
    :assessment,
    :location,
    :message,
    :method,
    :unit
  ].freeze

  attr_accessor *ATTRIBUTES
end
