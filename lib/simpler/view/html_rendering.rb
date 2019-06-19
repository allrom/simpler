# To change this license header, choose License Headers in Project Properties.
class HTMLRendering
  include EnvData

  def initialize(env)
    @env = env
  end

  def file_to_render
    template_file = "#{template_path}.html.erb"
    File.read(template_file) if File.file?(template_file)
  end
end
