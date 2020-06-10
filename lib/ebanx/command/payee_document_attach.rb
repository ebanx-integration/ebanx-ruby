module Ebanx
  module Command
    class PayeeDocumentAttach < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payee/attach'
        @response_type  = :json
      end

      def validate
        validate_presence :id
        validate_presence :document
        validate_presence :document_type
      end
    end
  end
end
