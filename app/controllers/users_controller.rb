class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
