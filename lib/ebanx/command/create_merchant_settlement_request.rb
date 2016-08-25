module Ebanx
  module Command
    class CreateMerchantSettlementInfo < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'merchantSettlement/createSettlementRequest'
        @response_type  = :json
      end

      def validate
        validate_presence :message
        validate_presence :from_name
        validate_presence :from_email
      end
    end
  end
end