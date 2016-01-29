class User
  ATTRIBUTES = [
    :id,
    :account,
    :created,
    :removed,
    :member,
    :role
  ].freeze

  attr_accessor *ATTRIBUTES
end
