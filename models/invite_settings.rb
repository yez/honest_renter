module HonestRenter
  class InviteSettings < BaseModel
    ATTRIBUTES = [
      :id,
      :account,
      :assessment,
      :location,
      :message,
      :method,
      :unit
    ].freeze

    attr_accessor *ATTRIBUTES

    include Unrequestable

    class << self
      def attr_name
        'invite_settings'
      end
    end
  end
end
