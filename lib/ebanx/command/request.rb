module Ebanx
  module Command
    class Request < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'request'
        @response_type  = :json
      end

      def validate
        validate_presence :currency_code
        validate_presence :amount
        validate_presence :merchant_payment_code
        validate_presence :name
        validate_presence :email
        validate_presence :payment_type_code
      end

      def params
        @params.to_json
      end
    end
  end
end
