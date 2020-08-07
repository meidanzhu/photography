class Photo < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_one_attached :image
    
    validates :title, presence: true
    validates :caption, presence: true
    validates :caption, length: { maximum: 250 }

    accepts_nested_attributes_for :user, :category
end
