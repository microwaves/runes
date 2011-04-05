require 'runes/railtie'
require File.dirname(__FILE__) + '/runes/core'
ActiveRecord::Base.extend Runes
