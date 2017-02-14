module Ebanx
  module Command
    class PayoutCancel < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payout/cancel'
        @response_type  = :json
      end

      def validate
        validate_presence_or :external_reference, :uid
      end
    end
  end
end
