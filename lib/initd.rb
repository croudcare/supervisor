require_relative './template'

class Initd

  def initialize(config)
    @config = config
    @template = Template.new("environment.sh.erb")
  end

  def run
    @template.render({ env: @config.env , rails_root_path: @config.rails_root, rails_root_shared: @config.rails_shared }, "/etc/init.d/god")
  end

end