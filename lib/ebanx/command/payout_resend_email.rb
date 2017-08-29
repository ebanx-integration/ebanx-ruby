module Ebanx
  module Command
    class PayoutResendEmail < Command
      def initialize(params)
        raise params.inspect
        @params         = params
        @request_method = :post
        @request_action = 'resendPayoutEmail'
        @response_type  = :json
      end

      def validate
        validate_presence :hash
        validate_presence :integration_key
      end
    end
  end
end
