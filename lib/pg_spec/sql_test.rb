require 'active_record'
module PgSpec
  class SQLTest

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


    def test(exp)
      exp == get_first(sql)
    end

    def test_result(exp)
      exp == get_all(sql)
    end

    private
    def get_first(sql)
      ActiveRecord::Base.connection.execute(sql).first.values.first
    end

    def get_all(sql)
      ActiveRecord::Base.connection.execute(sql).map(&:values)
    end
  end
end