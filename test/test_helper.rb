require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_record'

def setup_db
  ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')

  ActiveRecord::Schema.define(:version => 0) do
    create_table :products, :force => true do |t|
      t.string :name
      t.string :vendor
      t.datetime :created_at
    end
  end

  require File.dirname(__FILE__) + '/../lib/runes'
end
