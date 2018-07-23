class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :episode_id
      t.string :opening_crawl
      t.string :director
      t.string :producer
      t.datetime :release_date
      t.string :species, array: true
      t.string :starships, array: true
      t.string :vehicles, array: true
      t.string :characters, array: true
      t.string :planets, array: true
      t.string :url
      t.string :created
      t.string :edited
      t.timestamps
    end
  end
end
