require_relative './template'
require 'fileutils'

class GodInitd

  def initialize(config, template = "initd.sh.erb")
    @config = config
    @template = Template.new(template)
  end

  def run
    pid_file = "/var/run/god/god.pid"
    FileUtils.mkdir_p pid_file
    @template.render({pid_file: pid_file }, "/etc/init.d/god")
  end

end