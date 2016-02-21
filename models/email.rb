module HonestRenter
  class Email < BaseModel
    ATTRIBUTES = [
      :id,
      :address,
      :confirmed,
      :created,
      :flagged,
      :organization,
      :person
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'emails'
      end
    end
  end
end
