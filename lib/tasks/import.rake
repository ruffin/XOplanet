namespace :import do
  desc "import planets and get their images"

  task :all => :environment do
    planets_json = download_planets
    planets_json.each do |pj|
      import_planet(pj)
      download_images(pj)
    end
  end

  task :debug_download => :environment do
    planets_json = download_planets
    download_images(planets_json[0])
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

  def download_images(planet_json)
    # create file paths so other stuff can go in them
    base_path = "app/assets/images/planets/"
    file_path = base_path + planet_json['pl_name'] + '/'
    FileUtils.mkdir_p(file_path)

    loc_str = planet_json['ra_str'] + planet_json['dec_str']
    xml_url = "https://irsa.ipac.caltech.edu/applications/finderchart/servlet/api?locstr=#{loc_str}&survey=2mass,dss"
    xml = HTTParty.get(xml_url).body
    xml_doc = Nokogiri::XML(xml)
    color_image_nodes = xml_doc.xpath("//colorimage/imageurl").reverse # newest first
    other_image_nodes = xml_doc.xpath("//image/jpgurl").reverse

    # make the files for each
    color_image_nodes.each_with_index do |url_node, index|
      File.open(file_path + format('%03d', index) + '.jpg', 'w') do |file|
        file.binmode
        response = HTTParty.get(url_node.text())
        file.write(response.body)
        file.close
      end
    end

    index_offset = color_image_nodes.size

    other_image_nodes.each_with_index do |url_node, index|
      File.open(file_path + format('%03d', index + index_offset) + '.jpg', 'w') do |file|
        file.binmode
        response = HTTParty.get(url_node.text())
        file.write(response.body)
        file.close
      end
    end
  end

end
