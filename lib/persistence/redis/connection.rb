module Persistence
  module Redis
    module Connection
      extend ActiveSupport::Concern

      module ClassMethods
        def redis
          Rails.configuration.redis
        end
      end

      def redis
        self.class.redis
      end

    end
  end
end
