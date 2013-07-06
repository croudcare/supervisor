#!/usr/bin/env ruby

require_relative 'lib/configurator'
require_relative 'lib/host_configurer'
include HostConfigurer

raise 'Must run as ROOT' unless Process.uid == 0


Configurator.config("scheduler") do

  rails_root "/home/ubuntu/public_html/scheduler/current"
  rails_shared "/home/ubuntu/public_html/scheduler/shared"
  env "production"

end

configure_host
