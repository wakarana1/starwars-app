class CreateStarships < ActiveRecord::Migration[5.1]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :starship_class
      t.string :manufacturer
      t.string :cost_in_credits
      t.string :length
      t.string :crew
      t.string :passengers
      t.string :max_atmosphering_speed
      t.string :hyperdrive_rating
      t.string :MGLT
      t.string :cargo_capacity
      t.string :consumables
      t.string :films, array: true
      t.string :pilots, array: true
      t.string :url
      t.string :created
      t.string :edited
      t.timestamps
    end
  end
end
