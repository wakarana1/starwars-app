class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birth_year
      t.string :eye_color
      t.string :gender
      t.string :hair_color
      t.string :height
      t.string :mass
      t.string :skin_color
      t.string :homeworld
      t.string :films, array: true
      t.string :species, array: true
      t.string :starships, array: true
      t.string :vehicles, array: true
      t.string :url
      t.timestamps
    end
  end
end
