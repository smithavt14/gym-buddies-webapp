class AddCoordinatesToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :latitude, :float
    add_column :workouts, :longitude, :float
  end
end
