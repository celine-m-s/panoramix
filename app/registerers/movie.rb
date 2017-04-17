require_relative '../validators/movie'

class MovieRegisterer

  attr_accessor :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def valid?
    MovieValidator.new(attributes).valid?
  end

  def register
    valid? && Movie.create(attributes) 
  end

end