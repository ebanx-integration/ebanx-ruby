module Ebanx
  module Command
    class ResendPaymentNotification < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payment/resendNotification'
        @response_type  = :json
      end

      def validate
        validate_presence :hash
        validate_presence :secret
      end
    end
  end
end