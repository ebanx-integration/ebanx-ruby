module Ebanx
  module Command
    class EditMerchantIntegrationProperties < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'merchantIntegrationProperties/edit'
        @response_type  = :json
      end

      def validate
        validate_presence :image
        validate_presence :url_response
        validate_presence :receipt_email
        validate_presence :url_status_change_notification
      end
    end
  end
end