class Movie < ApplicationRecord
  validates :video_url, presence: true

end
