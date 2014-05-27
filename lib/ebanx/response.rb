module Ebanx
  class Response
    attr_accessor :http_code, :raw_response, :response

    def initialize(response, response_type)
      @http_code    = response.code
      @raw_response = response.to_str
      @response     = response.to_str

      @response = JSON.parse @response if response_type == :json
    end
  end
end