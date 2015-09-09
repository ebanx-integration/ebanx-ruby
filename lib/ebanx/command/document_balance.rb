module Ebanx
  module Command
    class DocumentBalance < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'documentbalance'
        @response_type  = :json
      end

      def validate
        validate_presence :currency_code
        validate_presence :document
      end
    end
  end
end