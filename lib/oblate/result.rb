require 'ostruct'

module Oblate
  module Result

    def success(detail = {})
      Success.new(detail)
    end

    def failure(detail = {})
      Failure.new(detail)
    end
  end

  module Result
    class Success < OpenStruct

      def succeeded?
        true
      end

      def failed?
        false
      end
    end
  end

  module Result
    class Failure < OpenStruct

      def succeeded?
        false
      end

      def failed?
        true
      end
    end
  end
end
