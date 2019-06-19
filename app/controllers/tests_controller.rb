class TestsController < Simpler::Controller

  def index
    ## render plain: "* Simpler Tests *"
    ## render xml: 'tests/info'
    render 'tests/list'

    status 203
    headers['X-New-Header'] = 'Show Test'

    @time = Time.now
  end

  def show; end

  def create; end
end
