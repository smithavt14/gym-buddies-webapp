class AddPhotoToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :photo, :string
  end
end
