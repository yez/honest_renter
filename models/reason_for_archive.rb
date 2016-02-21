module HonestRenter
  class ReasonForArchive < BaseModel
    ATTRIBUTES = [
      :id,
      :label
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'reasons_for_archive'
      end
    end
  end
end
