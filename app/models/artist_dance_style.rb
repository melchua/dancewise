# frozen_string_literal: true

class ArtistDanceStyle < ApplicationRecord
  belongs_to :artist
  belongs_to :dance_style
end
