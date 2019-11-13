namespace :import do
  desc "import planets and get their images"

  task :all => :environment do
    planets_json = download_planets
    import_planets(planets_json)
    planets_json.each |pj| do
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

  def import_planets(planet_json)
    attribute_names = Planet.new.attribute_names
    planets_json.each |pj| do
      Planet.find_or_create_by(pj.select{|x| attribute_names.index(x.to_s)})
    end
  end

  def download_image

  end
end
