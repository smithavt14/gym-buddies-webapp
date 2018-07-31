class WorkoutsController < ApplicationController

  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Review.new(workout_params)
    @workout.save
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :description, :location, :max_participants, :time)
  end

end
