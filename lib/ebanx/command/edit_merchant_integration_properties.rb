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
      end
    end
  end
end
