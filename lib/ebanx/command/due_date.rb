module Ebanx
  module Command
    class DueDate < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'duedate'
        @response_type  = :json
      end

      def validate
        validate_presence :due_date
        validate_presence :hash
      end
    end
  end
end
