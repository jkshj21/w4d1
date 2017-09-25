# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :artist_id, presence:true
  validates :title, uniqueness:true, presence:true
  validates :title, uniqueness: { scope: :artist_id }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'User'


  has_many :shared,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

  has_many :shared_viewers,
    through: :shared,
    source: :viewer

    def self.artwork_for_user_id
      self
        .left_outer_joins(:artwork_shares)
        .where('(artist_id = user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
        .distinct 

    end

end
