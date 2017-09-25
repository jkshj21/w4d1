# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, uniqueness:true, presence:true

  has_many :artworks,

    foreign_key: :artist_id,
    class_name: 'Artwork',
    dependent: :destroy

  has_many :shared,
    foreign_key: :viewer_id,
    class_name: 'ArtworkShare',
    dependent: :destroy

    has_many :shared_artworks,
      through: :shared,
      source: :artworks,
      dependent: :destroy

end
