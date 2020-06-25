module Ebanx
  module Command
    class PayoutCreate < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payout/create'
        @response_type  = :json
      end

      def validate
        validate_presence :external_reference
        validate_presence :amount
        validate_presence :currency_code
        validate_presence :payee
        validate_presence :payee, :document
      end
    end
  end
end
