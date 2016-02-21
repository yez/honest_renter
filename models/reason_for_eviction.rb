module HonestRenter
  class ReasonForEviction < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'reasons_for_eviction'
      end
    end
  end
end
