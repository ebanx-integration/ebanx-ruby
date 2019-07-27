module Ebanx
  module Command
    class Command
      attr_accessor :request_method, :request_action, :response_type, :request_body
      attr_writer :params

      def valid?
        validate
      end

      def params
        # Wraps parameters into request_body
        if defined?(@request_body) && @request_body
          { request_body: @params.to_json }
        else
          @params
        end
      end

      protected
      def validate
        raise NotImplementedError
      end

      def validate_presence(*names)
        raise ArgumentError.new("Missing argument #{names}") unless @params.dig(*names)
        true
      end

      def validate_with_callback(names, callback)
        callback.call(@params.dig(*names), @params)
      end

      def validate_presence_or(name1, name2)
        unless @params.include?(name1) || @params.include?(name2)
          raise ArgumentError.new("Missing argument, obligatory #{name1} or #{name2}")
        end

        true
      end

      def validate_presence_either(args)
        args.each do |arg|
          if @params.include?(arg)
            return true
          end
        end

        raise ArgumentError.new("Missing all arguments: #{args.join(", ")}.")
      end
    end
  end
end
