require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_record'
require 'test_unit_extension'

def setup_db
  ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')

  ActiveRecord::Schema.define(:version => 0) do
    create_table :nuts, :force => true do |t|
      t.string :name
      t.string :content
      t.datetime :created_at
    end
  end

  require File.dirname(__FILE__) + '/../lib/runes'
end

ActiveSupport::TestCase.send :extend, Test::Unit
