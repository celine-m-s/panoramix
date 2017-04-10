class CreateMovies < ActiveRecord::Migration[5.1]
  def up
    create_table :movies do |t|
      t.string :source
      t.string :link
      t.string :title
      t.datetime :date
      t.string :video_url
    end
  end

  def down
    drop_table :movies do |t|
      t.string :source
      t.string :source_url
      t.string :title
      t.datetime :date
      t.string :video_url
    end
  end

end
