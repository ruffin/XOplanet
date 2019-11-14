class Compositor
  attr_reader :seed
  attr_reader :planet

  def initialize(planet)
    @planet = planet
    @seed = hash(planet.pl_name)
  end

  def self.glob(subdir, suffix)
    Dir.glob("#{Rails.root}/app/assets/images/#{subdir}/*#{suffix}").tap do |list|
      self.class_variable_set "@@#{subdir}_length".to_sym, list.length
    end
  end

  # BACKGROUNDS = glob('planets', '.jpg').freeze
  EYES = glob('eyes', '.png').freeze

  # def background_file
  #   BACKGROUNDS[seed % @@planets_length]
  # end

  def foreground_file
    EYES[seed % @@eyes_length]
  end

  def background
    @background ||= begin
      rotations = seed % 4
      # use `background_file` eventually but right now just pick the first because **COLOR**
      canvas = ChunkyPNG::Image.from_file("app/assets/images/planets/#{planet.pl_name}/000.jpg")
      rotations.times {|_| canvas.rotate_right! }
      canvas
    end
  end

  def foreground
    retries = 0
    @foreground ||= begin
      image = ChunkyPNG::Image.from_file foreground_file
      width = (background.width * 0.4).round
      aspect_ratio = image.width / image.height
      height = (width / aspect_ratio).round
      image.resample_bilinear!(width, height)
      image
    rescue
      @seed += 1
      retries += 1
      retries < 5 ? retry : raise
    end
  end

  def composite
    @composite ||= background.compose(foreground, x_offset, y_offset)
  end

  def x_offset
    ((background.width - foreground.width) / 2) + offset_noise
  end

  def y_offset
      (background.height - foreground.height) / 4
  end

  def hash(str)
    Digest::MD5.hexdigest(str).to_i(16)
  end

  def offset_noise
    pos_neg = [1,-1].sample
    ((seed % 120) - 60) * pos_neg
  end
end
