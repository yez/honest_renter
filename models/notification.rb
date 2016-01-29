class Notification
  ATTRIBUTES = [
    :id,
    :person,
    :type,
    :subscribed
  ].freeze

  attr_accessor *ATTRIBUTES
end
