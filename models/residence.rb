module HonestRenter
  class Residence < BaseModel
    ATTRIBUTES = [
      :id,
      :address,
      :city,
      :country,
      :candidate,
      :created,
      :reason_for_leaving,
      :references,
      :start_date,
      :state,
      :unit_label
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'residences'
      end
    end
  end
end
