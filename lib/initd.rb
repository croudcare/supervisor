require_relative './template'

class Initd

  def initialize(config)
    @config = config
    @template = Template.new("enviroment.sh.erb")
  end

  def run
    @template.render(config, "/etc/init.d/god")
  end

end