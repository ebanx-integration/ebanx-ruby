module Ebanx
  module Command
    class GetMerchantSettlementStatement < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'merchantSettlement/getStatement'
        @response_type  = :json
      end

      def validate
        validate_presence :start_date
        validate_presence :end_date
      end
    end
  end
end