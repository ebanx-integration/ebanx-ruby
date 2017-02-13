module Ebanx
  module Command
    class DepositRetrieve < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'deposit/retrieve'
        @response_type  = :json
      end

      def validate
        validate_presence_or :deposit_code, :uid
      end
    end
  end
end