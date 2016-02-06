class Candidate < BaseModel
  ATTRIBUTES = [
    :id,
    :administrations,
    :best_time_to_contact,
    :currently_employed,
    :emergency_contacts,
    :explination_for_background_checks,
    :explination_for_eviction,
    :has_been_evicted,
    :has_explination_for_background_check,
    :has_pet,
    :has_problems_with_landlord,
    :has_vehicle,
    :problems_with_landlord,
    :residences,
    :smoking_status,
    :pets,
    :vehicles
  ].freeze


  attr_accessor *ATTRIBUTES

  class << self
    def attr_name
      'candidates'
    end
  end
end
