module Ebanx
  module Command
    class GetMerchantIntegrationProperties < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'merchantIntegrationProperties/get'
        @response_type  = :json
      end

      def validate
      end
    end
  end
end
