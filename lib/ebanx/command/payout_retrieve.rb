module Ebanx
  module Command
    class PayoutRetrieve < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payout/retrieve'
        @response_type  = :json
      end

      def validate
        validate_presence_or :external_reference, :uid
      end
    end
  end
end
