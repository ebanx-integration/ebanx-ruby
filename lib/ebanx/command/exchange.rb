module Ebanx
  module Command
    class Exchange < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'exchange'
        @response_type  = :json
      end

      def validate
        validate_presence :currency_code
      end
    end
  end
end