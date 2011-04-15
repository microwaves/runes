require 'test_helper'

class RunesTest < ActiveSupport::TestCase
  setup_db
  ActiveRecord::Base.send :extend, Runes::Orm::ActiveRecord
  
  class Nut < ActiveRecord::Base
    acts_as_indexable
  end
  
  def test_has_loaded_correctly
    assert_equal [], Nut.all
  end

end
