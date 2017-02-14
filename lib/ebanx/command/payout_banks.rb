module Ebanx
  module Command
    class PayoutBanks < Command
      def initialize()
        @request_method = :post
        @request_action = 'payout/banks'
        @response_type  = :json
      end

      def validate
      end
    end
  end
end
