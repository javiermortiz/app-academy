class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence: true
    
    belongs_to :viewer, 
        class_name: :User,
        primary_key: :id,
        foreign_key: :viewer_id 

    belongs_to :artwork,
        class_name: :Artwork,
        primary_key: :id, 
        foreign_key: :artwork_id 
end 