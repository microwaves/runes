module Runes
  module Orm
    module ActiveRecord
      attr_accessor :index_name
      attr_accessor :type_name

      def acts_as_indexable(options={})
        send :include, InstanceMethods
        @index_name = self.name.underscore.gsub(/\//, '-').pluralize
        @type_name = self.name.underscore.gsub(/\//, '-').singularize
        Runes::Base.set_actor(@index_name)
        after_destroy :destroy_object_from_index
        after_save :add_object_to_index
      end

      def search(query)
        search = Runes::Base.search(query, @index_name)
        results = search.map{|result| result.ar_object}
        return results.sort_by(&:created_at)
      end
    end

    module InstanceMethods
      def destroy_object_from_index
        $es_client.delete(self.id.to_s, :index => self.class.index_name, :type => self.class.type_name)
      end

      def add_object_to_index
        $es_client.index(self.to_json, :id => self.id, :index => self.class.index_name, :type => self.class.type_name)
      end
    end
  end
end
