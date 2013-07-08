require_relative './template'
require 'fileutils'

class Environment

  def initialize(config, template = "environment.sh.erb")
    @config = config
    @template = Template.new(template)
  end

  def run
    @template.render({ env: @config.env,
                       rails_root_path: @config.rails_root,
                       rails_root_shared: @config.rails_shared }, "/etc/profile.d/#{@config.name}.sh")
    FileUtils.chmod 0755, "/etc/profile.d/#{@config.name}.sh"
  end

end