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

      def search(query, index)
        $es_client.search(query, :index => index)
      end
    end
  end
end
