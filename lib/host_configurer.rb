require_relative './goder'
require_relative './initd'

module HostConfigurer
  extend self

  def configure_host
    copy_god_conf
    setup_init_d
  end

  private
  def copy_god_conf
    ::Goder.new(Environment.configuration).run
  end

  def setup_init_d
    ::Initd.new(Environment.configuration).run
  end
end