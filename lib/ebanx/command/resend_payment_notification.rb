module Ebanx
  module Command
    class ResendPaymentNotification < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'everest/resendNotification'
        @response_type  = :json
      end

      def validate
        validate_presence :hash
      end
    end
  end
end