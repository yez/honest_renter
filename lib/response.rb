class Response
  HAPPY_STATUSES = [200, 300]

  def initialize(raw_response)
  end

  def parse

  end

  def status

  end

  def success?
    HAPPY_STATUSES.include?(status.floor)
  end
end
