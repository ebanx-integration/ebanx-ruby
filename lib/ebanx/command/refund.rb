module Ebanx
  module Command
    class Refund < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'refund'
        @response_type  = :json
      end

      def validate
        validate_presence :operation

        # Validation for a new refund request
        if @params[:operation] == 'request'
          validate_presence :hash
          validate_presence :amount
          validate_presence :description
        #Validation for a refund cancel request
        else
          validate_presence_or :merchant_refund_code, :refund_id
        end
      end
    end
  end
end
