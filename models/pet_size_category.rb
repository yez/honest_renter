module HonestRenter
  class PetSizeCategory < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'pet_size_categories'
      end
    end
  end
end
