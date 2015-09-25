require "pg_spec/version"

module PgSpec
  autoload :SQLTest, 'pg_spec/sql_test'

  def self.included(base)
    base.extend(ClassMethods)
  end


  def initialize(*args)
    @regress = []
    super
  end

  def regress
    @regress
  end

  module ClassMethods
    def sql_true(sql, a, b = nil, desc = nil,  &block)
      it desc do
        r = SQLTest.new(sql, a, b)
        self.regress<<sql
        assert(r.test('t'), proc {"#{r.sql}\n#{block.call(self,r)}"})
      end
    end

    def sql_cmp_out(sql, a, b = nil, desc = nil,  &block)
      it desc do
        r = SQLTest.new(sql, a, b)
        self.regress<<sql
        assert(r.test(b), proc {"#{r.sql}\n#{block.call(self,r)}"})
      end
    end

    def values(*args)
      args
    end

    def row(*args)
      args.map(&:to_s)
    end

    alias :r :row

    def transaction(&block)
      SQLTest.connection.exec("BEGIN")
      yield
      SQLTest.connection.exec("ROLLBACK")
    end

    def results_eq(sql, exp, desc =  nil)
      it desc do
        r = SQLTest.new(sql, sql)
        self.regress<<sql
        assert(r.test_result(exp), proc {"#{r.sql}\n#{diff exp, r.eall}"})
      end
    end

    def cmp a, op, b, desc = nil
      sql_true "SELECT #{a} #{op} #{b}", a, b, desc do |a,r|
        "Expected #{r.ea} to be #{op} #{r.eb}"
      end
    end

    def is a, b, desc = nil
      sql_true("SELECT #{a} = #{b}", a, b, desc) do |a,r|
        a.diff r.eb, r.ea
      end
    end

    def isnt a, b, desc = nil
      sql_true("SELECT #{a} <> #{b}", a, b, desc) do |a,r|
        "Expected #{r.ea} to <> #{r.eb}"
      end
    end

    def output(a, b, desc = nil)
      sql_cmp_out("SELECT #{a}", a, b, desc) do |a,r|
        "Expected #{r.ea} to output #{b}\n#{a.diff r.ea, b}"
      end
    end

    def matches a, b, desc = nil
      sql_true("SELECT #{a} ~ #{b}", a, b, desc ) do |a,r|
        "Expected #{r.ea} to match #{r.eb}"
      end
    end

    def imatches a, b, desc = nil
      sql_true("SELECT #{a} ~* #{b}", a, b) do |a,r|
        "Expected #{r.ea} to match #{r.eb}"
      end
    end

    def isa a, b, desc = nil
      sql_true("SELECT pg_typeof(#{a}) = '#{b}'::regtype", "pg_typeof(#{a})", "'#{b}'::regtype",  desc) do |a,r|
        "Expected #{a} to be of type #{b}\n #{a.diff r.eb, r.ea}"
      end
    end

    def ok a, desc=nil
      sql_true("SELECT #{a}", a, nil, desc) do |a,r|
        a.diff 't', r.ea
      end
    end
  end
end