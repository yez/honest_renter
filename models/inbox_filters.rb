module HonestRenter
  class InboxFilters < BaseModel
    ATTRIBUTES = [
      :id,
      :account,
      :ascending,
      :location,
      :max_results,
      :show_archived,
      :sort_by,
      :unit,
      :within_date,
      :within_days
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'inbox_filters'
      end
    end
  end
end
