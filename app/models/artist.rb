# frozen_string_literal: true

class Artist < ApplicationRecord
  # This VideoHelper and Youtube Regex line is super important to avoid the uninitialize error message.
  # make sure that you create the videos_helpers.rb file and two make sure YOUTUBE_REGEX is defined in the model.
  include VideosHelper
  YOUTUBE_REGEX = %r(^(https*://)?(www.)?(youtube.com|youtu.be)/(watch\?v=){0,1}([a-zA-Z0-9_-]{11}))

  belongs_to :user
  has_many :event_artists
  has_many :events, through: :event_artists
  has_many :artist_dance_styles
  has_many :dance_styles, through: :artist_dance_styles
  belongs_to :event_status, optional: true, class_name: "EventStatus", foreign_key: "event_status_id"
  has_rich_text :description
  has_one_attached :avatar
  validates_uniqueness_of :name
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 3000 }

  # def youtube_embed_url
  #   video_links.map do |video|
  #     youtube_id = YOUTUBE_REGEX.match video
  #   end
  #   youtube_id[6] || youtube_id[5] if youtube_id
  # end

  # Be sure the filterrific is in the gemfile, stop the server, 'gem install filterrific' and then run bundle install and bundle update!
  filterrific(
    default_filter_params: { sorted_by: "created_at_desc" },
    available_filters: %i[
      sorted_by
      search_query
      event_id
      dance_style_id
    ]
  )

  # The filterrific gem needs this scope function to be setup for it to work, the only change I made was to line 40 for the order to be pointed to artists.

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = /desc$/.match?(sort_option) ? "desc" : "asc"
    case sort_option.to_s
    when /^created_at_/
      # Simple sort on the created_at column.
      # Make sure to include the table name to avoid ambiguous column names.
      # Joining on other tables is quite common in Filterrific, and almost
      # every ActiveRecord table has a 'created_at' column.
      order("artists.created_at #{direction}")
    end
  }
end
