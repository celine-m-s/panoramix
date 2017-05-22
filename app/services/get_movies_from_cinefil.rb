class GetMoviesFromCinefil

  include Singleton

  def call
      source = 'Cinefil'
      doc = Nokogiri::HTML(open('http://www.cinefil.com/bandes-annonces-cinema/sorties-de-la-semaine'))
      parent = doc.css('#postRequestData .chill-pls')
      movies = parent.css('img.play-button.modal-trigger')
      images = parent.css('img.modal-trigger:not(.play-button)')
      movies = doc.css('#postRequestData img.play-button.modal-trigger')

      index = -1
      movies.map do |movie|
        index += 1
        # Find useful information
        a = String.new(movie.attributes["data-video"])
        attributes = {}
         a.gsub(/"/, '').split(',').each do |b|
          couple = b.split(':')
          attributes[couple[0]] = couple[1]
        end
        vid =   attributes['video_url']

        # Get the right image in array
        thumbnail = images[index].attribute('src')

        {
          source: source,
          link: movie.attribute("data-movie-link").value,
          title: movie.attribute("data-movie-title").value,
          date: Date.today,
          video_url: "http://videos.cinefil.com/#{vid}.mp4",
          thumbnail: thumbnail.value
        }

      end

  end

end
