require 'erb'

class Template

  def initialize(template)
    @template = File.join(folder, template)
    @renderer = ERB.new(File.read(@template))
  end

  def render(locals, output)
    File.open(output, 'w') do |f|
      f.write @renderer.result(locals)
    end
  end

  private
  def folder
    File.expand_path("templates", __FILE__)
  end

end