module Ebanx
  module Command
    class GetCurrencyRatesForUsdAndEur < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'exchange/getCurrencyRatesForUsdAndEur'
        @response_type  = :json
      end

      def validate
      end
    end
  end
end
