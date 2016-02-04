class Member
  ATTRIBUTES = [
    :id,
    :has_password,
    :inbox_filters,
    :invite_settings,
    :is_system_admin,
    :password,
    :send_reports_by_email,
    :users
  ].freeze

  attr_accessor *ATTRIBUTES

  class << self
    def find(id)
      client = HonestRenter::Client.new
      request = HonestRenter::Request.new(client, id)
      url = "/members/#{id}"
      request.get(url)
    end
  end
end
