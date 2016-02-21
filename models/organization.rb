module HonestRenter
  class Organization < BaseModel
    ATTRIBUTES = [
      :id,
      :accounts_with_access,
      :added_by,
      :name,
      :emails,
      :phones,
      :positions,
      :preferred_email,
      :preferred_phone
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'organizations'
      end
    end
  end
end
