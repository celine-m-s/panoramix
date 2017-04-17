require 'rails_helper'

describe Movie do

  it 'without a video_url should not be valid' do
    movie = MovieRegisterer.new(
      source: 'Cinefil',
      link: 'http://www.cinefil.com/film/a-bras-ouverts',
      title: 'A bras ouverts',
      date: Date.today
    )
    expect(movie.valid?).to be_falsy
  end
  
  it 'with mandatory fields should be valid' do
    movie = MovieRegisterer.new(
      source: 'Cinefil',
      link: 'http://www.cinefil.com/film/a-bras-ouverts',
      title: 'A bras ouverts',
      date: Date.today,
      video_url: 'http://videos.cinefil.com/vid_58920034426da.mp4'
    )

    expect(movie.valid?).to be_truthy
  end
end
