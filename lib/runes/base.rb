module Runes
  module Base
    def self.set_actor(model)
      @actors ||= []
      @actors << model.to_s
    end

    def self.actors
      @actors
    end
  end
end
