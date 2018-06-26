# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create(
  source: 'Cinefilm',
  link: 'http://www.cinefilm.com/amovie',
  title: 'Summer in Paris',
  video_url: 'http://cinefilm.com/slkdlsd.mp4',
  thumbnail: 'http://cinefilm.ksssss.jpg',
  is_read: false
)
