require 'active_record'
class Minitest::Spec
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
      proc {
        "#{sql}\n#{block.call}"
      }
    end

    def test
      "t" == get_first(sql)
    end

    private
    def get_first(sql)
      ActiveRecord::Base.connection.execute(sql).first.values.first
    end
  end

  class << self


    def cmp a, op, b, desc=nil
      it desc do
        r = SQLRunner.new("SELECT #{a} #{op} #{b}", a, b)
        assert(r.test, r.msg{"Expected #{r.ea} to be #{op} #{r.eb}"} )
      end
    end

    def is a, b
      it desc do
        r = SQLRunner.new("SELECT #{a} = #{b}", a, b)
        assert(r.test, r.msg{ diff r.eb, r.ea })
      end
    end

    def isnt a, b
      it desc do
        r = SQLRunner.new("SELECT #{a} <> #{b}", a, b)
        assert(r.test, r.msg{ "Expected #{r.ea} to not be equal to #{r.eb}"})
      end
    end

    def matches a, b
      it desc do
        r = SQLRunner.new("SELECT #{a} ~ #{b}", a, b)
        assert(r.test, r.msg{ "Expected #{r.ea} to match #{r.eb}"})
      end
    end

    def imatches a, b
      it desc do
        r = SQLRunner.new("SELECT #{a} ~* #{b}", a, b)
        assert(r.test, r.msg{ "Expected #{r.ea} to match #{r.eb}"})
      end
    end

    def isa a, b
      it desc do
        r = SQLRunner.new("SELECT pg_typeof(#{a}) = #{b}::regtype", "pg_typeof(#{a})", "#{b}::regtype")
        assert(r.test, r.msg{ "Expected #{a} to be of type #{b}\n #{diff r.eb, r.ea}"})
      end
    end


    def ok a,desc=nil
      it desc do
        r = SQLRunner.new("SELECT #{a}", a)
        assert(r.test)
      end
    end
  end
end