require 'pg_spec/version'
require 'pg_spec/configuration'

module PgSpec
  autoload :SQLTest, 'pg_spec/sql_test'
  autoload :Log, 'pg_spec/log'
  autoload :Row, 'pg_spec/row'
  autoload :Header, 'pg_spec/header'

  def self.included(base)
    base.extend(ClassMethods)
    PgSpec.configuration.before_all

    def before_setup
      PgSpec.configuration.before_each
    end

    def after_teardown
      PgSpec.configuration.after_each
    end
  end

  module ClassMethods
    def sql_true(sql, a, b = nil, desc = nil,  &block)
      transaction = true if self.class_variable_defined? :@@transaction
      cl = caller_locations(2,1).first
      it desc do
        r = SQLTest.new(sql, a, b)
        r.execute "BEGIN" if transaction
        begin
          assert(r.test('t'), proc {"#{r.sql}\n#{block.call(self,r)}"})
        rescue Exception => e
          raise e
        ensure
          r.execute "ROLLBACK" if transaction
          Log.new(sql, desc, cl, transaction, e).write(PgSpec.configuration.log)
        end
      end
    end

    def sql_cmp_out(sql, a, b = nil, desc = nil,  &block)
      transaction = true if self.class_variable_defined? :@@transaction
      cl = caller_locations(2,1).first
      it desc do
        r = SQLTest.new(sql, a, b)
        r.execute "BEGIN" if transaction
        begin
          assert(r.test(b), proc {"#{r.sql}\n#{block.call(self,r)}"})
        rescue Exception => e
          raise e
        ensure
          r.execute "ROLLBACK" if transaction
          Log.new(sql, desc, cl, transaction, e).write(PgSpec.configuration.log)
        end
      end
    end

    def values(*args)
      args
    end

    def row(*args)
      Row.new args.map(&:to_s)
    end

    alias :r :row

    def header(*args)
      Header.new args.map(&:to_s)
    end

    alias :h :header

    def transaction(&block)
      self.class_variable_set :@@transaction, true
      yield
      self.remove_class_variable(:@@transaction)
    end

    def results_eq(sql, exp, desc =  nil)
      transaction = true if self.class_variable_defined? :@@transaction
      cl = caller_locations(1,1).first
      it desc do
        r = SQLTest.new(sql, sql)
        r.execute "BEGIN" if transaction
        begin
          assert(r.test_result(exp), proc {"#{r.sql}\n#{diff exp, r.sql_all}"})
        rescue Exception => e
          raise e
        ensure
          r.execute "ROLLBACK" if transaction
          Log.new(sql, desc, cl, transaction, e).write(PgSpec.configuration.log)
        end
      end
    end

    def cmp a, op, b, desc = nil
      desc ||= "#{a} should #{op} #{b}"
      sql_true "SELECT #{a} #{op} #{b}", a, b, desc do |s,r|
        "Expected #{r.sql_a} to be #{op} #{r.sql_b}"
      end
    end

    def is a, b, desc = nil
      desc ||= "#{a} should = #{b}"
      sql_true("SELECT #{a} = #{b}", a, b, desc) do |s,r|
        s.diff r.sql_b, r.sql_a
      end
    end

    def isnt a, b, desc = nil
      desc ||= "#{a} should <> #{b}"
      sql_true("SELECT #{a} <> #{b}", a, b, desc) do |s,r|
        "Expected #{r.sql_a} to <> #{r.sql_b}"
      end
    end

    def output(a, b, desc = nil)
      sql_cmp_out("SELECT #{a}", a, b, desc) do |s,r|
        "Expected #{r.sql_a} to output #{b}\n#{s.diff r.sql_a, b}"
      end
    end

    def matches a, b, desc = nil
      desc ||= "#{a} should match #{b}"
      sql_true("SELECT #{a} ~ #{b}", a, b, desc ) do |s,r|
        "Expected #{r.sql_a} to match #{r.sql_b}"
      end
    end

    def imatches a, b, desc = nil
      desc ||= "#{a} should match #{b}"
      sql_true("SELECT #{a} ~* #{b}", a, b, desc) do |s,r|
        "Expected #{r.sql_a} to match #{r.sql_b}"
      end
    end

    def isa a, b, desc = nil
      desc ||= "#{a} should be of type #{b}"
      sql_true("SELECT pg_typeof(#{a}) = '#{b}'::regtype", "pg_typeof(#{a})", "'#{b}'::regtype",  desc) do |s,r|
        "Expected #{a} to be of type #{b}\n #{s.diff r.sql_b, r.sql_a}"
      end
    end

    def ok a, desc=nil
      desc ||= "#{a} should be true"
      sql_true("SELECT #{a}", a, nil, desc) do |s,r|
        s.diff 't', r.sql_a
      end
    end
  end
end