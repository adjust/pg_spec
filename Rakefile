require 'rake'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'pg_spec/db_task'

PgSpec::DbTask.new(:db)

task :default => ['db:test:prepare', :test]

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
  t.libs << 'spec'
end
