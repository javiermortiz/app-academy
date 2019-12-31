class Album < ApplicationRecord
    validates :title, :year, :band_id

    belongs_to :band,
        class_name: :Band,
        primary_key: :id,
        foreign_key: :band_id 
end