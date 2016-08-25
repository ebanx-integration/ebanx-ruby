module Ebanx
  module Command
    class GetMerchantSettlementInfo < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'merchantSettlement/getBalanceInformations'
        @response_type  = :json
      end

      def validate
      end
    end
  end
end