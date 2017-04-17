require_relative '../registerers/movie.rb'

class Movie < ApplicationRecord
  
  def new(params)
    MovieRegister.new(params)
  end

  def create
    if self.success?
      super
    end
  end
end
