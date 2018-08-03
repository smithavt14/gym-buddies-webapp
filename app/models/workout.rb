class Workout < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  acts_as_taggable_on :tags
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def nicetime
    self.time.strftime("%b %e, %l:%M %p")
  end
end
