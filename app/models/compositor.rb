class Compositor
  attr_reader :seed

  def initialize(seed)
    converted_seed = seed.is_a?(String) ? hash(seed) : seed
    @seed = converted_seed
  end

  def self.glob(subdir)
    Dir.glob("#{Rails.root}/app/assets/images/#{subdir}/*.png").tap do |list|
      self.class_variable_set "@@#{subdir}_length".to_sym, list.length
    end
  end

  BACKGROUNDS = glob('planets').freeze
  EYES = glob('eyes').freeze
  FACES = glob('faces').freeze

  def background_file
    BACKGROUNDS[seed % @@planets_length]
  end

  def foreground_file
    EYES[seed % @@eyes_length]
  end

  def background
    @background ||= begin
      rotations = seed % 4
      canvas = ChunkyPNG::Image.from_file(background_file)
      rotations.times {|_| canvas.rotate_right! }
      canvas
    end
  end

  def foreground
    @foreground ||= begin
      retries = 0
      image = ChunkyPNG::Image.from_file foreground_file
      image.resample_bilinear!(325, (325 / image.width) * image.height)
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
