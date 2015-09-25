module PgSpec
  class SQLTest

    class << self
      def connection
        @@con
      end
    end

    def initialize(sql, a, b=nil)
      @sql, @a, @b = sql, a, b
    end

    def ea
      @ea ||= get_first("SELECT #{@a}")
    end

    def eb
      @eb ||= get_first("SELECT #{@b}")
    end

    def eall
      @all ||= get_all(sql)
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
      exp == eall
    end

    private

    def connection
      @@con
    end

    def get_first(sql)
      connection.exec(sql).first.values.first
    end

    def get_all(sql)
      connection.exec(sql).map(&:values)
    end
  end
end