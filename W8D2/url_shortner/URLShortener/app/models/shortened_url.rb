class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true
    validates :short_url, uniqueness: true
end