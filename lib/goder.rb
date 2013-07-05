require 'fileutils'

class Goder

  def initialize(environment)
    @environment = environment
    @god_folder = File.expand_path("../templates/god", __FILE__)
  end

  def run
    FileUtils.cp_r @god_folder, "/etc/god"
  end

end