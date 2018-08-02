class Workout < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  
  
  def nicetime
    self.time.strftime("%b %e, %l:%M %p")
  end
end
