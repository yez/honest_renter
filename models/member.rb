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
end
