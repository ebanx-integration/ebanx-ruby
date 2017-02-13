module Ebanx
  module Command
    class Zipcode < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'zipcode'
        @response_type  = :json
      end

      def validate
        validate_presence :zipcode
      end
    end
  end
end
