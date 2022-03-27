class Artist < ApplicationRecord
# This VideoHelper and Youtube Regex line is super important to avoid the uninitialize error message. 
# make sure that you create the videos_helpers.rb file and two make sure YOUTUBE_REGEX is defined in the model.
  include VideosHelper
  YOUTUBE_REGEX = %r(^(http[s]*:\/\/)?(www.)?(youtube.com|youtu.be)\/(watch\?v=){0,1}([a-zA-Z0-9_-]{11}))

  has_many :event_artists
  has_many :events, through: :event_artists
  has_many :artist_dance_styles
  has_many :dance_styles, through: :artist_dance_styles

  validates_uniqueness_of :name
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :image_url, length: { minimum: 10, maximum: 200 }
  validates :first_video_id, length: { in: 0..255, allow_nil: false } 
  serialize :video_links, Array 

  # In order to add an arrray to the Artist I migrated " add_column :artists, :video_links, :string " and also added "serialize :video_links, Array" to the Arist model. I was able to add strings to the database via the rails console by assigning a letter to Artist.first, and then running "a.video_links<<"https://youtu.be/CyO_Vda2IMg"" and I was able to repeat this for multiple links and then I ran a.save! #

  def youtube_embed_url
    normal_url = self.video_links.each do |v| puts v
    end
    youtube_id = YOUTUBE_REGEX.match normal_url.to_str
    if youtube_id
      youtube_id[6] || youtube_id[5]
    end
    embed_url = "http://www.youtube.com/embed/#{ youtube_id[5] }"
  end

  # def youtube_embed_link
  #   normal_link = self.video_links
  #   youtube_id = YOUTUBE_REGEX.match normal_link.to_str
  #   if youtube_link
  #     youtube_link[6] || youtube_link[5]
  #   end
  #   embed_link = "http://www.youtube.com/embed/#{ youtube_link[5] }"
  # end

  # Be sure the filterrific is in the gemfile, stop the server, 'gem install filterrific' and then run bundle install and bundle update!
  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :event_id,
      :dance_style_id
    ]
  )

  # The filterrific gem needs this scope function to be setup for it to work, the only change I made was to line 40 for the order to be pointed to artists.

  scope :sorted_by, ->(sort_option) {
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
