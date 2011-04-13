require 'runes'
require 'rails'

module Runes
  class Railtie < Rails::Railtie
    # Extends module into active_record.
    initializer 'runes.extend.active_record', :before => "active_record.initialize_timezone" do
      ActiveRecord::Base.send :extend, Runes::Orm::ActiveRecord
    end
    
    # Initialize models in order to perform the Runes function.
    initializer 'runes.ref_models', :after => :engines_blank_point do
      Dir.glob(RAILS_ROOT + '/app/models/*.rb').each { |file| require file }
    end

    # Verify and setup the actors defined by the user.
    initializer 'runes.create_indexes', :after => 'runes.exec_models'  do
      Runes::Janitor.setup!
    end
  end
end
