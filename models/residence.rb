class Residence
  ATTRIBUTES = [
    :id,
    :address,
    :city,
    :country,
    :candidate,
    :created,
    :reason_for_leaving,
    :references,
    :start_date,
    :state,
    :unit_label
  ].freeze

  attr_accessor *ATTRIBUTES
end
