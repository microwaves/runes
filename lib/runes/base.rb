module Runes
  module Base
    def self.set_actors(model)
      @actors ||= []
      @actors << model
    end
  end
end
