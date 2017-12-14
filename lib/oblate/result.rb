require 'ostruct'

module Oblate
  module Result
    def success(detail = {})
      Success.new(detail)
    end

    class Success < OpenStruct

      def succeeded?
        true
      end
    end
  end
end
