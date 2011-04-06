module Runes
  module Core
    def create_index(model_name, create_options={})
      $es_client.create_index(model_name, create_options)
    end
  end
end
