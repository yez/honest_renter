module HonestRenter
  class TimeOfDay < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'times_of_day'
      end
    end
  end
end
