class Artist < ApplicationRecord
  has_many :event_artists
  has_many :events, through: :event_artists

  validates_uniqueness_of :name
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :image_url, length: { minimum: 10, maximum: 200 }
<<<<<<< Updated upstream
end
=======
  # validates :first_video_id, presence: true
  validates :first_video_id, length: { in: 0..255, allow_nil: false } 

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by, 
      :search_query,
      :event_id,
      :dance_style_id
    ]
  )

scope :created_at_desc, ->(sort_key) {
    # Sorts students by sort_key
    direction = /desc$/.match?(sort_option) ? "desc" : "asc"
  case sort_option.to_s
  when /^created_at_/  
  end 
}

scope :sorted_by, ->(sort_option) {
  direction = /desc$/.match?(sort_option) ? "desc" : "asc"
  case sort_option.to_s
  when /^created_at_/
    order("artists.created_at #{direction}")
  end
}


  def self.options_for_sorted_by
    [
      ["Name (a-z)", "name_asc"],
      ["Registration date (newest first)", "created_at_desc"],
      ["Registration date (oldest first)", "created_at_asc"],
      ["Country (a-z)", "country_name_asc"],
    ]
  end

 def youtube_embed_url
  # if self.first_video_id.nil?
  #   "No videos added yet."
  # else
    normal_url = self.first_video_id
    youtube_id = YOUTUBE_REGEX.match normal_url.to_str
    if youtube_id
      youtube_id[6] || youtube_id[5]
    end
    embed_url = "http://www.youtube.com/embed/#{ youtube_id[5] }"
   
end
end
>>>>>>> Stashed changes
