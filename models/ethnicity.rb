module HonestRenter
  class Ethnicity < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'ethnicities'
      end
    end
  end
end
