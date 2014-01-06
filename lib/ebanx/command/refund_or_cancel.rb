module Ebanx
  module Command
    class RefundOrCancel < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'refundOrCancel'
        @response_type  = :json
      end

      def validate
        validate_presence :hash
        validate_presence :description
      end
    end
  end
end