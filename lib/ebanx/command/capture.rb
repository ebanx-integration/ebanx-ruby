module Ebanx
  module Command
    class Capture < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'capture'
        @response_type  = :json
      end

      def validate
        validate_presence_or :hash, :merchant_payment_code
      end
    end
  end
end