class Environment

  def self.config
    @config
  end

  def self.condif(&block)
    @config =  DSL.new.instance_eval &block
  end

  class DSL
    attr_accessor :rails_root, :rails_shared, :env
    def rails_root(value)
      @rails_root = value
    end

    def rails_shared(value)
      @rails_shared = value
    end

    def env(value)
      @env = value
    end
  end

end

