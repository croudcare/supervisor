require 'fileutils'

class Goder

  def initialize(environment)
    @environment = environment
    @god_folder =  File.join(File.expand_path("../..", __FILE__), "templates/god")
  end

  def run
    FileUtils.cp_r @god_folder, "/etc/god"
  end

end