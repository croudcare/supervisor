require_relative './template'

class GodInitd

  def initialize(config)
    @config = config
    @template = Template.new("initd.sh.erb")
  end

  def run
    @template.render({}, "/etc/init.d/#{@config.name}")
  end

end