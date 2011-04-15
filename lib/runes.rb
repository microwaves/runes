require 'rails'
require 'rubberband'

module Runes
  require 'runes/railtie' if defined?(Rails)
  require 'runes/janitor'
  require 'runes/base'
  require 'runes/orm/active_record'

  begin
    config_path = Rails.root.to_s + '/config/runes.yml'
    @config = YAML.load_file(config_path)
  rescue
    @config = nil
  end

  if Runes::Janitor.es_is_running?
    @server_host = @config.nil? ? '127.0.0.1:9200' : @config['host'] + ':' + @config['port']
    $es_client = ElasticSearch.new(@server_host)
  end

end
