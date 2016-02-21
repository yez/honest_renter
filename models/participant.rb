module HonestRenter
  class Participant < BaseModel
    ATTRIBUTES = [
      :id,
      :administration,
      :assessments,
      :custom_id,
      :password,
      :results,
      :study
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'participants'
      end
    end
  end
end
