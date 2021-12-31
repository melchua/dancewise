class Artist < ApplicationRecord
  has_many :event_artists
  has_many :events, through: :event_artists

  validates_uniqueness_of :name
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :image_url, length: { minimum: 10, maximum: 200 }
end
