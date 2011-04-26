require 'runes'
require 'rails'

module Runes
  class Railtie < Rails::Railtie
    # Check if elasticsearch is running.
    initializer 'runes.check_es_status', :before => 'i18n.callbacks' do
      if Runes::Janitor.es_is_running? == false
        raise "Elasticsearch server is not running."
      end
    end

    # Include module into Rubberband's ElasticSearch::Api::Hit
    initializer 'runes.include.rubberband', :before => 'active_record.initialize_timezone' do
      ElasticSearch::Api::Hit.send :include, Runes::RubberbandExt
    end

    # Extends module into active_record.
    initializer 'runes.extend.active_record', :after => 'runes.include.rubberband' do
      ActiveRecord::Base.send :extend, Runes::Orm::ActiveRecord
    end
    
    # Initialize models in order to perform the Runes function.
    initializer 'runes.req_models', :after => :engines_blank_point do
      Dir.glob(Rails.root.to_s + '/app/models/*.rb').each { |file| require file }
    end

    # Verify and setup the actors defined by the user.
    initializer 'runes.create_indexes', :after => 'runes.req_models'  do
      Runes::Janitor.setup!
    end
  end
end
