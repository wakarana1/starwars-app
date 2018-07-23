class CreatePlanets < ActiveRecord::Migration[5.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :diameter
      t.string :rotation_period
      t.string :orbital_period
      t.string :gravity
      t.string :population
      t.string :climate
      t.string :terrain
      t.string :surface_water
      t.string :residents, array: true
      t.string :films, array: true
      t.string :url
      t.string :created
      t.string :edited
      t.timestamps
    end
  end
end
