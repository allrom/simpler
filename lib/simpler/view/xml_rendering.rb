# To change this license header, choose License Headers in Project Properties.
class XMLRendering
  include EnvData

  def initialize(env)
    @env = env
  end

  def file_to_render
    template_file = "#{template_path}.xml.erb"
    File.read(template_file) if File.file?(template_file)
  end
end
