FactoryGirl.define do
  factory :movie do
    source 'Cinefil'
    source_url 'http://www.cinefil.com/film/a-bras-ouverts'
    title 'A bras ouverts'
    date Date.today
    video_url 'http://videos.cinefil.com/vid_58920034426da.mp4'
  end
  
  trait :empty do
    video_url ''
  end
end
