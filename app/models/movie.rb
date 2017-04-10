class Movie < ApplicationRecord
  validates :video_url, presence: true

  def self.get_latests_from_cinefilm
    source = 'Cinefilm'
    doc = Nokogiri::HTML(open('http://www.cinefil.com/bandes-annonces-cinema/sorties-de-la-semaine'))
    movies = doc.css('#postRequestData img.play-button.modal-trigger')

    movies.each do |movie|
      vid = movie.attributes["data-video"]["video_url"]
      Movie.create(
          source: source,
          link: movie.attributes["data-movie-link"],
          title: movie.attributes["data-movie-title"],
          date: Date.today,
          video_url: "http://videos.cinefil.com/#{vid}.mp4"
        )
    end
  end
end
