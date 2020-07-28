class User < ApplicationRecord
    has_many :photos
    has_many :categories, through: :photos
    has_secure_password
    
    validates :username, presence: true
    validates :username, uniqueness: true
end
