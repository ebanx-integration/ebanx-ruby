module Ebanx
  module Command
    class TransferCommit < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'transfer/commit'
        @response_type  = :json
      end

      def validate
        validate_presence_or :transfer_code, :uid, :external_reference, :settlement_code
      end
    end
  end
end
