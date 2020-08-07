class Category < ApplicationRecord
    has_many :photos
    has_many :users, through: :photos
    
    validates :name, uniqueness: true
    
    scope :alpha, -> {order(:name)}

    
end
