class HomeController < ApplicationController
  def index
    # @planet = Planet.order('RANDOM()').first
    @name = params[:name] || random_string
    @composition = Compositor.new(@name).composite
  end

  def random_string
    (0...8).map { (65 + rand(26)).chr }.join
  end
end
