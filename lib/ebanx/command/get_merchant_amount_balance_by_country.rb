module Ebanx
  module Command
    class GetMerchantAmountBalanceByCountry < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'merchantSettlement/getAmountBalanceByCountry'
        @response_type  = :json
      end

      def validate
        validate_presence :country_abbreviation
      end
    end
  end
end