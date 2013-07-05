require_relative './goder'
require_relative './god_initd'
require_relative './configurator'
require_relative './environment'

module HostConfigurer
  extend self

  def configure_host
    copy_god_conf
    setup_init_d
    setup_environment
  end

  private
  def copy_god_conf
    ::Goder.new(Configurator.configuration).run
  end

  def setup_init_d
    ::GodInitd.new(Configurator.configuration).run
  end

  def setup_environment
    ::Environment.new(Configurator.configuration).run
  end
end