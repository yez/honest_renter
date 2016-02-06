class Reference < BaseModel
  ATTRIBUTES = [
    :id,
    :created,
    :person,
    :position,
    :relationship,
    :residence
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'references'
    end
  end
end
