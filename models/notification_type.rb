module HonestRenter
  class NotificationType < BaseModel
    ATTRIBUTES = [
      :id,
      :label,
      :active
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'notification_types'
      end
    end
  end
end
