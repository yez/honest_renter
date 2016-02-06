class Notification < BaseModel
  ATTRIBUTES = [
    :id,
    :person,
    :type,
    :subscribed
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'notifications'
    end
  end
end
