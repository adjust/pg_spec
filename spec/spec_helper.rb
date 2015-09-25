require 'rubygems'
require 'pg_spec'
require 'pg'

ENV['PGSPEC_ENV']  ||= 'test'
# require File.expand_path('../../config/boot', __FILE__)

Dir.glob('spec/support/**/*.rb').each { |f| require f }

class PgSpec::SQLTest
  testdb = "pg_spec_test"
  PG.connect(dbname: 'postgres', user: 'postgres', host: 'localhost').exec("DROP DATABASE IF EXISTS #{testdb}")
  PG.connect(dbname: 'postgres', user: 'postgres', host: 'localhost').exec("CREATE DATABASE #{testdb}")
  @@con = PG.connect(dbname: testdb, user: 'postgres', host: 'localhost')
end

