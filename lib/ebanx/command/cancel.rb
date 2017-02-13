module Ebanx
  module Command
    class Cancel < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'cancel'
        @response_type  = :json
      end

      def validate
        validate_presence :hash
      end
    end
  end
end
