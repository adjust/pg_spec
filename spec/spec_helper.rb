require 'rubygems'
require 'pg_spec'
require 'pg'

class PgSpec::SQLTest
  @@logdir =  Pathname.new File.expand_path('../../test/sql', __FILE__)
  @@logdir.mkpath
  @@root = Pathname.new File.expand_path('../../', __FILE__)

  testdb = "pg_spec_test"
  PG.connect(dbname: 'postgres', user: 'postgres', host: 'localhost').exec("DROP DATABASE IF EXISTS #{testdb}")
  PG.connect(dbname: 'postgres', user: 'postgres', host: 'localhost').exec("CREATE DATABASE #{testdb}")
  @@con = PG.connect(dbname: testdb, user: 'postgres', host: 'localhost')
end

