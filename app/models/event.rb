class Event < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 6, maximum: 100}
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :dance_type, presence: true
  validates :image_url, length: { minimum: 10, maximum: 200 }
  # validates :event_date, presence: true
end
