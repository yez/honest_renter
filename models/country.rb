class Country < BaseModel
  ATTRIBUTES = [
    :id,
    :country
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'countries'
    end
  end
end
