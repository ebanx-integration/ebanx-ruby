module Ebanx
  module Command
    class PayoutSimulate < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payout/simulate'
        @response_type  = :json
      end

      def validate
        validate_presence :country
        validate_presence :amount
        validate_presence :currency_code
      end
    end
  end
end
