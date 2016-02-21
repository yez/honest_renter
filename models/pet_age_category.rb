module HonestRenter
  class PetAgeCategory < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'pet_age_categories'
      end
    end
  end
end
