module HonestRenter
  class Name < BaseModel
    ATTRIBUTES = [
      :title,
      :first,
      :middle,
      :last,
      :previous_last,
      :suffix
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'names'
      end
    end
  end
end
