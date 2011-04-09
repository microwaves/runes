require 'runes'
require 'rails'

module Runes
  class Railtie < Rails::Railtie
    # Extends the module into active_record on app initialization.
    initializer "runes.extend.active_record" do
      ActiveRecord::Base.send :extend, Runes::Orm::ActiveRecord
    end

    # Verify and setup the actors defined by the user.
    initializer :after, "create_indexes" do
      Runes::Janitor.setup!
    end
  end
end
