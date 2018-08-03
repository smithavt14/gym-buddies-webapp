class WorkoutsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.where.not(latitude: nil, longitude: nil)

    @markers = @workouts.map do |workout|
      {
        lat: workout.latitude,
        lng: workout.longitude,
        infoWindow: { content: render_to_string(partial: "/workouts/map_box", locals: { workout: workout }) }
      }
    end
  end

  def show
    @related_workouts = @workout.find_related_tags

    @markers = [{
                  lat: @workout.latitude,
                  lng: @workout.longitude,
                  infoWindow: { content: render_to_string(partial: "/workouts/map_box", locals: { workout: @workout }) }
    }]
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    @workout.save
    redirect_to workout_path(@workout)
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
    params.require(:workout).permit(:name, :description, :location, :max_participants, :time, :photo, tag_list: [])
  end

end
