class MovieRegisterer

  SCHEMA = Dry::Validation.Schema do
    required(:video_url).filled
  end

  def initialize(params)
    SCHEMA.call(params)
  end

  def self.get_from_cinefil
    source = 'Cinefil'
    doc = Nokogiri::HTML(open('http://www.cinefil.com/bandes-annonces-cinema/sorties-de-la-semaine'))
    movies = doc.css('#postRequestData img.play-button.modal-trigger')
    aggregated_movies = []

    movies.each do |movie|
      vid = movie.attributes["data-video"]["video_url"]

      res = SCHEMA.call(
        source: source,
        link: movie.attributes["data-movie-link"],
        title: movie.attributes["data-movie-title"],
        date: Date.today,
        video_url: "http://videos.cinefil.com/#{vid}.mp4"
      )

      aggregated_movies << res

    end

    return aggregated_movies

  end

  def self.create_from_cinefil
    movies = self.get_from_cinefil
    movies.each do |m|
      Movie.create(m.to_h) unless m.failure?
    end
  end

end