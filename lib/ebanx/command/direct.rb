module Ebanx
  module Command
    class Direct < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'direct'
        @response_type  = :json
        @request_body   = true
      end

      def validate
        validate_presence :operation
        validate_presence :mode
        validate_presence :payment
      end
    end
  end
end