class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = %w(black brown white gray)
    validates :birth_date, :color, :name, :sex, presence: true 
    validates :color, inclusion: COLORS

    has_many :cat_rentals,
      class_name: :CatRental,
      primary_key: :id,
      foreign_key: :cat_id,
      dependent: :destroy

    def age
        time_ago_in_words(birth_date) + " old"
    end 
end 