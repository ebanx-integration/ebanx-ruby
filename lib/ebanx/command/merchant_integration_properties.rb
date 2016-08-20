module Ebanx
  module Command
    class MerchantIntegrationProperties < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'merchantIntegrationProperties'
        @response_type  = :json
      end

      def validate
        validate_presence :url_response
        validate_presence :url_status_change_notification
      end
    end
  end
end