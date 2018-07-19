class CreateSpecies < ActiveRecord::Migration[5.1]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.string :average_height
      t.string :average_lifespan
      t.string :eye_colors
      t.string :hair_colors
      t.string :skin_colors
      t.string :language
      t.string :homeworld
      t.string :people, array: true
      t.string :films, array: true
      t.string :url
      t.timestamps
    end
  end
end
