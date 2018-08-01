class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.workout = Workout.find(params[:workout_id])
    @booking.save
    redirect_to workout_path(@booking.workout)
  end

  def destroy

  end
end
