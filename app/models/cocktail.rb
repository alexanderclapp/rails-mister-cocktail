class Cocktail < ApplicationRecord
has_many :doses, dependent: :destroy
has_many :ingredients, through: :doses
has_attachment :photo
has_attachment :background_photo
validates :name, presence: true, uniqueness: true, allow_blank: false
validates :background_photo, presence: true
end
