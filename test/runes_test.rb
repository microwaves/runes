require 'test_helper'

class RunesTest < ActiveSupport::TestCase
  setup_db

  class Product < ActiveRecord::Base
    acts_as_indexable
  end
  
  def test_schema_has_loaded_correctly
    assert_equal [], Product.all
  end

end
