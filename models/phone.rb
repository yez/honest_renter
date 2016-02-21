module HonestRenter
  class Phone < BaseModel
    ATTRIBUTES = [
      :id,
      :country_code,
      :created,
      :extension,
      :flagged,
      :number,
      :formatted,
      :organization,
      :person,
      :type
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'phones'
      end
    end
  end
end
