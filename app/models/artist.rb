class Artist < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 100}
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :image_url, length: { minimum: 10, maximum: 200 }
end
