module WorkoutsHelper

  def placeholder(thing, image_placeholder)
    thing.photo.present? ? cl_image_path(thing.photo, height: 500, width: 800, crop: :fill) : image_path(image_placeholder)
  end

  def workout_placeholder(workout)
    placeholder(workout, 'placeholder.jpg')
  end

  def user_placeholder(workout)
    placeholder(workout.user, 'profile_placeholder.svg')
  end
end
