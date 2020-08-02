class Category < ApplicationRecord
    has_many :photos
    has_many :users, through: :photos

    validates :name, presence: true

    scope :alpha, -> {order(:name)}
    #scope :ordered_by_title, -> { reorder(title: :asc) }
end
