module Ebanx
  module Command
    class DepositCreate < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'deposit/create'
        @response_type  = :json
      end

      def validate
        validate_presence :amount
      end
    end
  end
end