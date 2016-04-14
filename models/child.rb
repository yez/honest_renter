module HonestRenter
  class Child < BaseModel
    ATTRIBUTES = [
      :id,
      :age,
      :applicant,
      :created
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'child'
      end
    end
  end
end
