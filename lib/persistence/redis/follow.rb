module Persistence
  module Redis
    class Follow
      include Connection

      def self.all
        Array.wrap(redis.smembers(key))
      end

      def self.create(person)
        redis.sadd(key, person)
      end

      def self.destroy(person)
        redis.srem(key, person)
      end

      def self.exists?(person)
        redis.sismember(key, person)
      end

      def self.key
        'follows'
      end

      def key
        self.class.key
      end

    end
  end
end
