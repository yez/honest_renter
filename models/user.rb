class User < BaseModel
  ATTRIBUTES = [
    :id,
    :account,
    :created,
    :removed,
    :member,
    :role
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'users'
    end
  end
end
