module Ebanx
  module Command
    class Query < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'query'
        @response_type  = :json
      end

      def validate
        validate_presence :hash
      end
    end
  end
end