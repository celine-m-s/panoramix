namespace :movies do 

  desc "Get latest movies"

  task :latests => :environment do
    MovieRegisterer.create_from_cinefil
  end
end