module Ebanx
  module Command
    class DepositSearch < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'deposit/search'
        @response_type  = :json
      end

      def validate
        validate_presence :date_from
        validate_presence :date_to
      end
    end
  end
end