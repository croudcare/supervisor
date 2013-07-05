require_relative './godder'
require_relative './initd'

module HostConfigurer
  extend self

  def configure_host
    copy_god_conf
    setup_init_d
  end

  private
  def copy_god_conf
    Godder.new(Environment.config).run
  end

  def setup_init_d
    Initd.new(Environment.config).run
  end
end