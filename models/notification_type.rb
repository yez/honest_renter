class NotificationType
  ATTRIBUTES = [
    :id,
    :label,
    :active
  ].freeze

  attr_accessor *ATTRIBUTES
end
