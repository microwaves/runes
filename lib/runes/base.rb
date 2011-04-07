module Runes
  module Base
    def self.set_actors(model)
      @actors ||= []
      @actors << model
    end

    def self.get_actors
      @actors
    end
  end
end
