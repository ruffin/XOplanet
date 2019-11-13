namespace :import do
  desc "import planets and get their images"

  task :all => :environment do
    planets_json = download_planets
    planets_json.each do |pj|
      import_planet(pj)
      download_image(pj)
    end
  end

  def download_planets
    url = 'https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?&table=exoplanets&format=json'
    res = HTTParty.get(url)
    res.body
    JSON.parse(res.body)
  end

  def import_planet(planet_json)
    attribute_names = Planet.new.attribute_names
    Planet.find_or_create_by(planet_json.select{|x| attribute_names.index(x.to_s)})
  end

  def download_image(planet_json)

  end
end
