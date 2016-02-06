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

  class << self
    def attr_name
      'invite_settings'
    end
  end
end
