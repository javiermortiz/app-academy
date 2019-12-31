class Band < ApplicationRecord
    #validates :name

    has_many :albums,
        class_name: :Album,
        primary_key: :id,
        foreign_key: :album_id 
end 