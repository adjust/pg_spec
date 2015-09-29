require 'minitest/assertions'

module PgSpec
  class SQLTest
    attr_accessor :sql
    include Minitest::Assertions

    def initialize(sql, a, b=nil)
      @sql, @a, @b = sql, a, b
      @result = {}
    end

    def sql_a
      @sql_a ||= get_first("SELECT #{@a}")
    end

    def sql_b
      @sql_b ||= get_first("SELECT #{@b}")
    end

    def sql_all
      @sql_all ||= get_all(sql)
    end


    def test(exp)
      @test ||= exp == get_first(sql)
    end

    def test_result(exp)
      if exp.first.is_a?(Header)
        @test ||= exp == sql_all.unshift(fields(sql))
      else
        @test ||= exp == sql_all
      end
    end

    def execute(sql)
      PgSpec.configuration.con.exec(sql)
    end

    private

    def fields(sql)
      result(sql).fields
    end

    def result(sql)
      @result[sql] ||= execute(sql)
    end

    def get_first(sql)
      result(sql).first.values.first
    end

    def get_all(sql)
      result(sql).map(&:values)
    end
  end
end