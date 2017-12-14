module Oblate
  class Service
    class << self
      private

        def respond_to_missing?(method_name, include_private = false)
          public_instance_methods.include?(method_name)
        end

        def method_missing(method, *args, &block)
          return super unless respond_to_missing?(method)
          new.send(method, *args, &block)
        end
    end
  end
end
