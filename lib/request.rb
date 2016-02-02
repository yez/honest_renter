class Request
  attr_reader :client

  def initialize(client)
    @client = client
  end

  def get(url, query_params = {})
    response = respond(client.connection.get(url))
    raise response.error unless response.success?
    response
  end

  def post(url, body, query_params = {})
    response = respond(client.connection.post(url, body))
    raise response.error unless response.success?
    response
  end

  private

  def respond(raw_response)
    Response.new(raw_response)
  end
end
