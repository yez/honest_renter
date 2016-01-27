class Applicant
  ATTRIBUTES = [
    :id,
    :account,
    :administration,
    :approved,
    :archived,
    :assessments,
    :candidate,
    :children,
    :code,
    :comments,
    :cooccupants,
    :correctedAddress,
    :desired_move_in_date,
    :fields,
    :invitation,
    :invite_cooccupants,
    :location,
    :location_is_correct,
    :metadata,
    :norm,
    :number_of_adults,
    :number_of_children,
    :reason_for_archiving,
    :reminders,
    :results,
    :sent_return_code,
    :unit,
    :viewings
  ].freeze

  attr_accessor *ATTRIBUTES
end
