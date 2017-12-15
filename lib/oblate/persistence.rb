module Oblate
  module Persistence

    def transaction
      ActiveRecord::Base.transaction do
        yield
      end
    end
  end
end
