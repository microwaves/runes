module Runes
  module Base
    class << self
      def set_actor(model)
        @actors ||= []
        @actors << model
      end

      def actors
        @actors
      end

      def search(query)
        $es_client.search(query)
      end
    end
  end
end
