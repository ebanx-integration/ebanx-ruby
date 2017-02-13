module Ebanx
  module Command
    class PayoutBalance < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payout/balance'
        @response_type  = :json
      end
    end
  end
end