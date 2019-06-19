# To change this license header, choose License Headers in Project Properties.
class SimplerLogger
  def initialize(file)
    @file = ::File.new(file, 'a+')
  end

  def http_info(env)
    @file.print(message(env).to_s)
    @file.puts
  end

  private

  def message(env)
    "\t\tRequest: #{env['REQUEST_METHOD']} #{env['PATH_INFO']}#{env['QUERY_STRING']}\r
    Handler: #{env['simpler.controller']&.class&.name}\##{env['simpler.action']}\r
    Parameters: #{env['simpler.controller']&.params}\r
    Response: #{env['simpler.controller']&.response&.status} \
    #{env['simpler.response_type']} #{env['simpler.template']}\r
    ------------------------------"
  end
end
