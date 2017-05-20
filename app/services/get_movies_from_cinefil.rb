class GetMoviesFromCinefil

  include Singleton

  def call
      source = 'Cinefil'
      doc = Nokogiri::HTML(open('http://www.cinefil.com/bandes-annonces-cinema/sorties-de-la-semaine'))
      movies = doc.css('#postRequestData img.play-button.modal-trigger')

      movies.map do |movie|
        a = String.new(movie.attributes["data-video"])
        attributes = {}
         a.gsub(/"/, '').split(',').each do |b|
          couple = b.split(':')
          attributes[couple[0]] = couple[1]
        end
        vid = attributes['video_url']

        {
          source: source,
          link: movie.attributes["data-movie-link"],
          title: movie.attributes["data-movie-title"],
          date: Date.today,
          video_url: "http://videos.cinefil.com/#{vid}.mp4"
        }

      end

  end

end
