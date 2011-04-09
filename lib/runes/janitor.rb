module Runes
  module Janitor
    def self.setup!
      Runes::Base.actors.each do |actor|
        $es_client.create_index(actor)
      end
    end
  end
end
