class RemoveWorkoutIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :workout
  end
end
