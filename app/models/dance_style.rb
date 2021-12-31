class DanceStyle < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25}
  validates_uniqueness_of :name
  has_many :event_dance_styles
  has_many :events, through: :event_dance_styles
end
