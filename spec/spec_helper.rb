require 'rubygems'
require 'pg_spec'
require 'pg'

PgSpec.configure do |c|
  c.logdir =  Pathname.new File.expand_path('../../test/sql', __FILE__)
  c.root = Pathname.new File.expand_path('../../', __FILE__)

  testdb = "pg_spec_test"
  PG.connect(dbname: 'postgres', user: 'postgres', host: 'localhost').exec("DROP DATABASE IF EXISTS #{testdb}")
  PG.connect(dbname: 'postgres', user: 'postgres', host: 'localhost').exec("CREATE DATABASE #{testdb}")

  c.con = PG.connect(dbname: testdb, user: 'postgres', host: 'localhost')

  # c.regress_format do | loc, desc, sql|
  #   "-- #{loc} \n" +
  #   "-- #{desc} \n" +
  #   "#{sql} \n"
  # end

  c.log do |log|
    log.puts log.loc
    log.puts log.desc
    log.puts log.sql
  end
end