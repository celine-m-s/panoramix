class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :source
      t.string :source_url
      t.string :title
      t.datetime :date
      t.string :video_url
    end
  end
end
