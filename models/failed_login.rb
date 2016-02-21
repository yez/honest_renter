module HonestRenter
  class FailedLogin < BaseModel
    ATTRIBUTES = [
      :id,
      :binary_ip,
      :created,
      :ip_address,
      :target
    ].freeze

    attr_accessor *ATTRIBUTES

    class << self
      def attr_name
        'failed_logins'
      end
    end
  end
end
