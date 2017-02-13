module Ebanx
  module Command
    class DepositCancel < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'deposit/cancel'
        @response_type  = :json
      end

      def validate
        validate_presence_or :deposit_code, :uid
      end
    end
  end
end
