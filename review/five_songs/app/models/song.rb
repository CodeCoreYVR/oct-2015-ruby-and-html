class Song < ActiveRecord::Base

  # scope :recent_five, -> { order("created_at DESC").limit(5) }

  def self.recent_five
    order("created_at DESC").limit(5)
  end

end
