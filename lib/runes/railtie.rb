require 'runes'
require 'rails'

module Runes
  class Railtie < Rails::Railtie
    # Extends the module into active_record on app initialization.
    initializer "runes.extend.active_record" do
      ActiveRecord.extend(Runes::Orm::ActiveRecord)
    end

    # Verify and setup the actors defined by the user.
    config.to_prepare do
      Runes::Plumber.setup!
    end

  end
end
