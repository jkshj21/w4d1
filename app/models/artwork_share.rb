# t.integer "artwork_id", null: false
# t.integer "viewer_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false



class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence:true
  validates :viewer_id, presence:true

  belongs_to :artworks,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'Artwork'

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: 'User'


end
