module Runes
  module Orm
    module ActiveRecord
      def acts_as_indexable(options={})
        Runes::Base.set_actor(self)
      end
    end
  end
end
