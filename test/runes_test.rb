require 'test_helper'

class RunesTest < ActiveSupport::TestCase
  setup do
    setup_db
    ActiveRecord::Base.send :extend, Runes::Orm::ActiveRecord
  end
 
  must "execute method" do
    class Nut < ActiveRecord::Base
      acts_as_indexable
    end
    assert_equal [], Nut.all
  end
  
end
