module Ebanx
  module Command
    class Token < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'token'
        @response_type  = :json
        @request_body   = true
      end

      def validate
        validate_presence :payment_type_code
        validate_presence :creditcard
      end
    end
  end
end