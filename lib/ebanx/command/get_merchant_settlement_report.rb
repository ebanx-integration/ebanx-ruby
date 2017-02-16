module Ebanx
  module Command
    class GetMerchantSettlementReport < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'merchantSettlement/getReport'
        @response_type  = :json
      end

      def validate
        validate_presence :settlement_id
      end
    end
  end
end