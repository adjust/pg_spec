module PgSpec
  class Configuration
    attr_accessor :options
    [:logdir, :root, :con].each do |m|
      define_method("#{m}=") do |val|
        @options[m]=val
      end

      define_method("#{m}") do
        @options[m]
      end

      def log(&block)
        @log = block
      end
    end

    def initialize
      @options = {}
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end