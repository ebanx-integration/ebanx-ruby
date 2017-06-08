module Ebanx
  module Command
    class TransferCreate < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'transfer/create'
        @response_type  = :json
      end

      def validate
        validate_presence :amount
      end
    end
  end
end
