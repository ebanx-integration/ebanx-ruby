module Ebanx
  module Command
    class PrintHtml < Command
      def initialize(params)
        @params         = params
        @request_method = :get
        @request_action = 'boleto/printHTML'
        @response_type  = 'text/html'
      end

      def validate
        validate_presence :hash
      end
    end
  end
end