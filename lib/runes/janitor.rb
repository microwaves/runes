module Runes
  module Janitor
    class << self
      def setup!
        if Runes::Janitor.es_is_running?
          Runes::Base.actors.each do |actor|
            $es_client.create_index(actor.to_s)
          end
        end
      end

      # This function was created because rubberband
      # behaves strangely and doesn't inform the system
      # properly when elasticsearch isn't running.
      def es_is_running?
        require 'socket'
        if @config.nil?
          # getting the longer line possible to avoid problems in different OSes.
          process_status = system("ps auxwwww | grep org.elasticsearch.bootstrap | grep -v grep")
          return process_status
        else
          net_status = TCPSocket.open(@config['host'], @config['port'].to_i)
          if net_status.nil?
            return false
          else
            return true
          end
        end
      end
    end
  end
end
