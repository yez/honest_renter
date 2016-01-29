class Participant
  ATTRIBUTES = [
    :id,
    :administration,
    :assessments,
    :custom_id,
    :password,
    :results,
    :study
  ].freeze

  attr_accessor *ATTRIBUTES
end
