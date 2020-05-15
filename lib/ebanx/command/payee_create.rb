module Ebanx
  module Command
    class PayeeCreate < Command
      def initialize(params)
        @params         = params
        @request_method = :post
        @request_action = 'payee/create'
        @response_type  = :json
      end

      def validate
        validate_presence :name
        validate_presence :email
        validate_presence :birth_date
        validate_presence :document
        validate_presence :document_type
        validate_presence :bank_name
        validate_presence :bank_branch
        validate_presence :bank_account
        validate_presence :bank_details
        validate_presence :account_type
        validate_presence :terms_accepted_at
      end
    end
  end
end
