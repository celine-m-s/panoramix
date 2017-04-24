require_relative '../../app/registerers/movie'

namespace :movies do 

  desc "Get latest movies"

  task :latests => :environment do
    if Time.now.monday?
      movies = GetMoviesFromCinefil.instance.call

      movies.each do |m|
        movie = MovieRegisterer.new(m)
        movie.register
      end
    end
  end
end