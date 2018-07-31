class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :max_participants
      t.datetime :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
