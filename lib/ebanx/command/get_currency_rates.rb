module Ebanx
  module Command
    class GetCurrencyRates < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'exchange/getCurrencyRates'
        @response_type  = :json
      end

      def validate
        validate_presence :currency_codes
      end
    end
  end
end
