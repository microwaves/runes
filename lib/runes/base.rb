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

      def indexes
      end
      
    end
  end
end
