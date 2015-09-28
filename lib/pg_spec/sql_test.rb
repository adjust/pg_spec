require 'minitest/assertions'

module PgSpec
  class SQLTest
    include Minitest::Assertions

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

    def log(msg)
      File.open(PgSpec.configuration.logdir.join(@@logfile_name), 'a'){|f| f.puts msg}
    end

    def execute(sql)
      log("#{sql};")
      PgSpec.configuration.con.exec(sql)
    end

    private

    def get_first(sql)
      execute(sql).first.values.first
    end

    def get_all(sql)
      execute(sql).map(&:values)
    end
  end
end