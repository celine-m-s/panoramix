class MovieValidator

  attr_accessor :attributes

  SCHEMA = Dry::Validation.Schema do
    required(:video_url).filled
  end

  def initialize(attributes)
    @attributes = attributes
  end

  def valid?
    SCHEMA.call(attributes).success?
  end

end