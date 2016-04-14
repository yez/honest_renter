module HonestRenter
  class ReasonForExclusion < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'reasons_for_exclusion'
      end
    end
  end
end
