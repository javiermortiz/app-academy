class Like < ApplicationRecord
    belongs_to :politest, polymorphic: true

end