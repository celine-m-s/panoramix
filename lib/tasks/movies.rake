require_relative '../../app/registerers/movie'

namespace :movies do 

  desc "Get latest movies"

  task :latests => :environment do
    movies = GetMoviesFromCinefil.instance.call

    movies.each do |m|
      movie = MovieRegisterer.new(m)
      movie.register
    end
  end
end