require 'rails'

module Runes
  require 'rubberband'
  require 'lib/runes/railtie' if defined?(Rails)
  require 'lib/runes/base'
  require 'lib/runes/orm/active_record'

  begin
    config_path = Rails.root.to_s + '/config/runes.yml'
    config = YAML.load_file(config_path)
  rescue NameError
    config = nil
  end

  $es_client = config.nil? ? ElasticSearch.new('127.0.0.1:9200') : ElasticSearch.new(config['host'], :timeout => 10)

  module Plumber
    def self.setup!
      @actors.each do |actor|
        $es_client.create_index(actor)
      end
    end
  end
end
