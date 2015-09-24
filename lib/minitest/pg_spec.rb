require 'active_record'

class Minitest::Test
  class SQLRunner

    def initialize(sql, a, b=nil)
      @sql, @a, @b = sql, a, b
    end

    def ea
      @ea ||= get_first("SELECT #{@a}")
    end

    def eb
      @eb ||= get_first("SELECT #{@b}")
    end

    def sql
      @sql
    end

    def msg(&block)
      proc {"#{sql}\n#{block.call(self)}"}
    end


    def test
      "t" == get_first(sql)
    end

    def run
      this = self
       Minitest::Spec.it do
        assert(this.test, this.msg )
       end
    end

    private
    def get_first(sql)
      ActiveRecord::Base.connection.execute(sql).first.values.first
    end
  end

  def initialize(*args)
    @regress = []
    super
  end

  def regress
    @regress
  end

  class << self
    def sql_test(sql, a, b=nil, desc = nil,  &block)
      it desc do
        r = SQLRunner.new(sql, a, b)
        self.regress<<sql
        assert(r.test, proc {"#{r.sql}\n#{block.call(self,r)}"})
      end
    end

    def cmp a, op, b, desc = nil
      sql_test "SELECT #{a} #{op} #{b}", a, b, desc do |a,r|
        "Expected #{r.ea} to be #{op} #{r.eb}"
      end
    end

    def is a, b, desc = nil
      sql_test("SELECT #{a} = #{b}", a, b, desc) do |a,r|
        a.diff r.eb, r.ea
      end
    end

    def isnt a, b, desc = nil
      sql_test("SELECT #{a} <> #{b}", a, b, desc) do |a,r|
        "Expected #{r.ea} to <> #{r.eb}"
      end
    end

    def output(a, b, desc = nil)
      sql_test("SELECT #{a}", a, b, desc) do |a,r|
        "Expected #{r.ea} to output #{b}\n#{a.diff r.ea, b}"
      end
    end

    def matches a, b, desc = nil
      sql_test("SELECT #{a} ~ #{b}", a, b, desc ) do |a,r|
        "Expected #{r.ea} to match #{r.eb}"
      end
    end

    def imatches a, b, desc = nil
      sql_test("SELECT #{a} ~* #{b}", a, b) do |a,r|
        "Expected #{r.ea} to match #{r.eb}"
      end
    end

    def isa a, b, desc = nil
      sql_test("SELECT pg_typeof(#{a}) = #{b}::regtype", "pg_typeof(#{a})", "#{b}::regtype",  desc) do |a,r|
        "Expected #{a} to be of type #{b}\n #{a.diff r.eb, r.ea}"
      end
    end


    def ok a, desc=nil
      sql_test("SELECT #{a}", a, nil, desc) do |a,r|
        a.diff 't', r.ea
      end
    end
  end
end