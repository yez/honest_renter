class Title < BaseModel
  ATTRIBUTES = [
    :id,
    :gender,
    :acronym
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'titles'
    end
  end
end
