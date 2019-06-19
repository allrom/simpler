# This middleware writes formatted web-server output
require_relative 'simpler_logger'

class HttpLogger
  def initialize(app)
    @app = app
    @logger = SimplerLogger.new(Simpler.root.join('log/simpler.log'))
  end

  def call(env)
    status, headers, body = @app.call(env)
    @logger.http_info(env)

    [status, headers, body]
  end
end
