module Runes
  module Orm
    module ActiveRecord
      def acts_as_indexable(options={})
        send :include, InstanceMethods
        Runes::Base.set_actor(self.class.name.underscore)
        after_destroy :destroy_object_from_index
        after_save :add_object_to_index
      end
    end

    module InstanceMethods
      def delete_index
      end

      def destroy_object_from_index
      end

      def add_object_to_index
        @class_name = self.class.name.underscore.gsub(/\//, '-')
        $es_client.index(self.to_json, :index => @class_name, :type => @class_name)
      end
    end
  end
end
