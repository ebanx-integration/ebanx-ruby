module Ebanx
  module Command
    class PayoutCreate < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payout/create'
        @response_type  = :json
      end

      def validate
        validate_presence :external_reference
        validate_presence :country
        validate_presence :amount
        validate_presence :currency_code
        validate_presence :payee
        validate_presence :payee, :name
        validate_presence :payee, :email
        validate_with_callback [:payee, :document], -> (value, object) {(object[:country] == 'mx' || !value.nil?) or raise ArgumentError.new("Missing argument [:payee, :document]")}
        validate_with_callback [:payee, :document_type], -> (value, object) {(object[:country] == 'mx' || !value.nil?) or raise ArgumentError.new("Missing argument [:payee, :document_type]")}
      end
    end
  end
end
