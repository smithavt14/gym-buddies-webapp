class Workout < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  acts_as_taggable_on :tags

  mount_uploader :photo, PhotoUploader
end
