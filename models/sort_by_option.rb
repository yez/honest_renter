module HonestRenter
  class SortByOption < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'sort_by_options'
      end
    end
  end
end
