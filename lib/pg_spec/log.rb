module PgSpec
  class Log
    attr_accessor :cl, :transaction

    def initialize(sql, desc, cl, transaction = false, exception = nil)
      @sql, @desc, @cl, @transaction, @exception = sql, desc, cl, transaction, exception
    end

    def puts(msg)
      File.open(file_path, 'a'){|f| f.puts msg} if msg
    end

    def loc
      loc = Pathname.new(cl.absolute_path).relative_path_from(PgSpec.configuration.root).to_s+":#{cl.lineno}"
      "-- #{loc}"
    end

    def pass?
      @exception.nil?
    end

    def error
      @exception.message unless pass?
    end

    def sql
      str = ""
      str += "BEGIN;\n" if transaction
      str += @sql
      str += ";" unless @sql.scan(/\S$/).last == ";"
      str += "ROLLBACK;\n" if transaction
      str
    end

    def desc
      "-- #{@desc}" if @desc
    end

    def write(block)
      block.call self
    end

    def file_path
      p = Pathname.new cl.path
      file_name = p.basename.sub_ext('.sql').sub('_spec','_test')
      PgSpec.configuration.logdir.join(file_name)
    end
  end
end

