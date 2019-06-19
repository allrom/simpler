# env data and methods helper Module
#
module EnvData
  VIEW_BASE_PATH = 'app/views'.freeze

  def render(binding)
    erb_init.result(binding)
  end

  private

  def controller
    @env['simpler.controller']
  end

  def action
    @env['simpler.action']
  end

  def template
    @env['simpler.template']
  end

  def template_path
    path = template || [controller.name, action].join('/')
    Simpler.root.join(VIEW_BASE_PATH, "#{path}")
  end

  def erb_init
    ERB.new(file_to_render)
  end
end
