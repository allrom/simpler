require 'erb'

require_relative 'view/env_data'
Dir.glob("./lib/simpler/view/*.rb").each { |file| require file }

module Simpler
  class View
    RENDERING_CLASSES = { plain: PlainRendering, html: HTMLRendering, xml: XMLRendering }.freeze

    def initialize(env)
      @env = env
    end

    def render(binding)
      rendering_class = RENDERING_CLASSES[response_type]
      rendering_class.new(@env).render(binding)
    end

    private

    def response_type
      @env['simpler.response_type']
    end
  end
end
