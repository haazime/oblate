require 'oblate/result'

module Oblate
  class Service
    include Result

    class << self
      private

        def respond_to_missing?(method_name, include_private = false)
          public_instance_methods.include?(method_name)
        end

        def method_missing(method, *args, &block)
          method_in_str = method.to_s

          with_bang = false
          candidate =
            if method_in_str.end_with?('!')
              with_bang = true
              method_in_str.chop.to_sym
            else
              method
            end

          return super unless respond_to_missing?(candidate)
          return call_service_method!(candidate, *args, &block) if with_bang
          call_service_method(candidate, *args, &block)
        end

        def call_service_method!(method, *args, &block)
          result = call_service_method(method, *args, &block)
          raise ExecutionFailed.new(result) if result.failed?
          result
        end

        def call_service_method(method, *args, &block)
          new.send(method, *args, &block)
        end
    end
  end

  class ExecutionFailed < StandardError
    attr_reader :result

    def initialize(result)
      @result = result
      super('Failed to execution')
    end
  end
end
