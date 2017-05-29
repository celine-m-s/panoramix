class MovieSerializer < ActiveModel::Serializer
  attributes :id, :link, :video_url, :title, :date, :thumbnail, :isRead
end
