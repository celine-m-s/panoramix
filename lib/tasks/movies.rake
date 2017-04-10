namespace :movies do 

  desc "Get latest movies"

  task :latests => :environment do |t, args|
    Movie.get_latests_from_cinefilm
  end
end