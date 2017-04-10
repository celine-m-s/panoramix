namespace :movies do 

  desc "Get latest movies"

  task :latests => :environment do |t, args|
    # my task
    10.times { Movie.create }
  end
end