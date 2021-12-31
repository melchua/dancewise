class Event < ApplicationRecord
  belongs_to :user
  has_many :event_dance_styles
  has_many :dance_styles, through: :event_dance_styles
  has_many :event_artists
  has_many :artists, through: :event_artists
  validates :name, presence: true, length: { minimum: 6, maximum: 100}
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :image_url, length: { minimum: 10, maximum: 200 }
  validates :event_date, presence: true
end
