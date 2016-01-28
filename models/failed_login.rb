class FailedLogin
  ATTRIBUTES = [
    :id,
    :binary_ip,
    :created,
    :ip_address,
    :target
  ].freeze

  attr_accessor *ATTRIBUTES
end
