module HonestRenter
  class SmokingStatusCategory < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'smoking_status_categories'
      end
    end
  end
end
