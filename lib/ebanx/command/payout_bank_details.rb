module Ebanx
  module Command
    class PayoutBankDetails < Command
      def initialize()
        @request_method = :post
        @request_action = 'payout/bankdetails'
        @response_type  = :json
      end

      def validate
      end
    end
  end
end
