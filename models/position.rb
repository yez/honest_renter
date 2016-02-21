module HonestRenter
  class Position < BaseModel
    ATTRIBUTES = [
      :id,
      :annual_income,
      :created,
      :end_date,
      :organization,
      :person,
      :references,
      :start_date,
      :title
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'positions'
      end
    end
  end
end
