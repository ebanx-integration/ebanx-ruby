class EbanxApiException < StandardError
  attr_accessor :response, :http_code

  def initialize(message, response, http_code)
    super(message)
    @response = response
    @http_code = http_code
  end
end
