class Environment

  def self.configuration
    @config
  end

  def self.config(&block)
    @config = DSL.new
    @config.instance_eval &block
  end

  class DSL

    attr_accessor :rails_root, :rails_shared, :env

    def initialize
      @rails_root , @rails_shared , @env  = nil, nil, nil
    end

    def rails_root(value=nil)
      @rails_root = value if @rails_root.nil?
      @rails_root
    end

    def rails_shared(value=nil)
      @rails_shared = value if @rails_shared.nil?
      @rails_shared
    end

    def env(value=nil)
      @env = value if @env.nil?
      @env
    end

  end

end

