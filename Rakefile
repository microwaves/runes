require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'psych' unless RUBY_VERSION < '1.9.2'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the runes plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the runes plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Runes'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Build gem for the runes railtie.'
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'runes'
    gem.summary = 'Elasticsearch Plugin'
    gem.description = 'Add elasticsearch to Rails models.'
    gem.email = 'me@zan.st'
    gem.homepage = 'http://github.com/zanst/runes'
    gem.authors = ['Stephano Zanzin']
    gem.files = Dir['*', '{lib}/**/*']
    gem.add_dependency('rubberband')
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler'
end
