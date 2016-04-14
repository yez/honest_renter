module HonestRenter
  class PhoneType < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'phone_types'
      end
    end
  end
end
