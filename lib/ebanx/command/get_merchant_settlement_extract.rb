module Ebanx
  module Command
    class GetMerchantSettlementExtract < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'merchantSettlement/getExtract'
        @response_type  = :json
      end

      def validate
        validate_presence :country_abbreviation
        validate_presence :currency_code
        validate_presence :date_field
        validate_presence :date
        validate_presence :hour
      end
    end
  end
end