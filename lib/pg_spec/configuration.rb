require "minitest"
module PgSpec
  class Configuration
    attr_accessor :options,:after_clb, :before_clb
    [:logdir, :root, :con].each do |m|
      define_method("#{m}=") do |val|
        @options[m]=val
      end

      define_method("#{m}") do
        @options[m]
      end

      def before(state, &block)
        raise "undefined state" unless [:suite, :all, :each].include?(state)
        @before_clb[state] << block
      end

      def after(state, &block)
        raise "undefined state" unless [:suite, :each].include?(state)
        @after_clb[state] << block
      end

      def log(&block)
        if block_given?
          @log = block
        else
          @log
        end

      end
    end

    def initialize
      @options = {}
      @before_clb = {suite: [], all: [], each: []}
      @after_clb = {suite: [], all: [], each: []}
    end

    def before_suite
      @before_clb[:suite].each(&:call)
    end

    def before_all
      @before_clb[:all].each(&:call)
    end

    def before_each
      @before_clb[:each].each(&:call)
    end

    def after_each
      @after_clb[:each].each(&:call)
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
    configuration.before_suite
    configuration.after_clb[:suite].each do |block|
      Minitest.after_run(&block)
    end
  end
end