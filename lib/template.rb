require 'erb'
require 'pry'

class Template

  def initialize(template)
    @template = File.join(folder, template)
    @renderer = ERB.new(File.read(@template))
  end

  def render(locals, output)
    File.open(output, 'w') do |f|
      f.write @renderer.result( view_data(locals) )
    end
  end

  def view_data(locals)
    OpenStruct.new(locals).instance_eval { binding }
  end

  private
  def folder
     File.join(File.expand_path("../..", __FILE__), "templates")
  end

end