module Ebanx
  module Command
    class TransferRetrieve < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'transfer/retrieve'
        @response_type  = :json
      end

      def validate
        validate_presence_or :transfer_code, :uid
      end
    end
  end
end
