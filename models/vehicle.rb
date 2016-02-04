class Vehicle
  ATTRIBUTES = [
    :id,
    :created,
    :license_plate,
    :make,
    :model,
    :owner,
    :year
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def find(id)
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, ENV['MEMBER_ID'])
      url = "/vehicles/#{id}"
      request.get(url)
    end
  end
end
