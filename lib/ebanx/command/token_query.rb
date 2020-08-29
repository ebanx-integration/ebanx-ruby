module Ebanx
  module Command
    class TokenQuery < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'token/query'
        @response_type  = :json
        @request_body   = true
      end

      def validate
        validate_presence :token
      end
    end
  end
end
