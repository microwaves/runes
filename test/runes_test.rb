require 'test_helper'

class RunesTest < ActiveSupport::TestCase
  setup do
    setup_db
    ActiveRecord::Base.send :extend, Runes::Orm::ActiveRecord
  end
 
  must "execute method and add object to index" do
    class Nut < ActiveRecord::Base
      acts_as_indexable
    end
    Nut.create!(:name => "nutixious", :content => "nuts do crackle")
    assert_equal 1, Nut.all.count
  end

end
