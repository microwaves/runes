require 'runes'
require 'rails'

module Runes
  class Railtie < Rails::Railtie
    initializer "runes.initialize" do |app|
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :extend, Runes
      end
    end
    
    rake_tasks do
      load 'tasks/runes.rake'
    end
  end
end
