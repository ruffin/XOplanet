class HomeController < ApplicationController
  def index
    if params[:name]
      @planet = Planet.find_by(pl_name: params[:name])
    else
      @planet = Planet.order('RANDOM()').first
    end
    # @images = Dir["app/assets/images/planets/#{@planet.pl_name}/*.jpg"]
    @composition = Compositor.new(@planet).composite
    @name = @planet.pl_name
    render is_match? ? 'match' : 'index'
  end

  private

  def random_string
    (0...8).map { (65 + rand(26)).chr }.join
  end

  def is_match?
    params[:like] && rand(10) < 5
  end
end
