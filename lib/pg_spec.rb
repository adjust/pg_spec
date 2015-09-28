require 'pg_spec/version'
require 'pg_spec/configuration'

module PgSpec
  autoload :SQLTest, 'pg_spec/sql_test'

  def self.included(base)
    cl = caller_locations(1,1).first
    p = Pathname.new cl.path
    base.class_variable_set :@@logfile_name, p.basename.sub_ext('.sql').sub('_spec','_test')
    base.extend(ClassMethods)
  end

  def before_setup
    SQLTest.class_variable_set :@@logfile_name, self.class.class_variable_get(:@@logfile_name)
  end


  module ClassMethods
    def sql_true(sql, a, b = nil, desc = nil,  &block)
      transaction = true if self.class_variable_defined? :@@transaction
      cl = caller_locations(2,1).first
      loc = Pathname.new(cl.absolute_path).relative_path_from(PgSpec.configuration.root).to_s+":#{cl.lineno}"
      it desc do
        r = SQLTest.new(sql, a, b)
        r.log("--#{loc}")
        r.log("-- #{desc}") if desc
        r.execute "BEGIN" if transaction
        assert(r.test('t'), proc {"#{r.sql}\n#{block.call(self,r)}"})
        r.execute "ROLLBACK" if transaction
      end
    end

    def sql_cmp_out(sql, a, b = nil, desc = nil,  &block)
      it desc do
        r = SQLTest.new(sql, a, b)
        r.log("-- #{desc}") if desc
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
      self.class_variable_set :@@transaction, true
      yield
      self.remove_class_variable(:@@transaction)
    end

    def results_eq(sql, exp, desc =  nil)
      transaction = true if self.class_variable_defined? :@@transaction
      cl = caller_locations(1,1).first
      loc = Pathname.new(cl.absolute_path).relative_path_from(PgSpec.configuration.root).to_s+":#{cl.lineno}"
      it desc do
        r = SQLTest.new(sql, sql)
        r.log("--#{loc}")
        r.log("-- #{desc}") if desc
        r.execute "BEGIN" if transaction
        begin
          assert(r.test_result(exp), proc {"#{r.sql}\n#{diff exp, r.eall}"})
        rescue Exception => e
          raise e
        ensure
          r.execute "ROLLBACK" if transaction
        end
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