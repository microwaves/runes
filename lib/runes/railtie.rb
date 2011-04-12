require 'runes'
require 'rails'

module Runes
  class Railtie < Rails::Railtie
    # Extends the module into active_record on app initialization.
    #initializer 'runes.extend_active_record' do
    initializer 'runes.extend.active_record', :before => 'runes.exec_models' do
      ActiveRecord::Base.send :extend, Runes::Orm::ActiveRecord
    end

    # Temporary fix maybe?
    initializer 'runes.exec_models', :after => :engines_blank_point do
      ActiveRecord::Migrator.migrate(Rails.application.paths["db/migrate"].to_a, ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    end

    # Verify and setup the actors defined by the user.
    initializer 'runes.create_indexes', :after => 'runes.exec_models'  do
      Runes::Janitor.setup!
    end
  end
end
