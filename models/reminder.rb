module HonestRenter
  class Reminder < BaseModel
    ATTRIBUTES = [
      :id,
      :applicant,
      :created,
      :destination,
      :sender
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'reminders'
      end
    end
  end
end
