module Ebanx
  module Command
    class Command
      attr_accessor :params, :request_method, :request_action, :response_type

      def valid?
        validate
      end

      def params

      end

      protected
      def validate
        raise NotImplementedError
      end

      def validate_presence(name)
        raise ArgumentError unless @params.include? name
        true
      end

      def validate_presence_or(name1, name2)
        unless @params.include?(name1) || @params.include?(name2)
          raise ArgumentError
        end

        true
      end
    end
  end
end