class User < ApplicationRecord
    has_many :photos
    has_many :categories, through: :photos
    
    has_secure_password
    
    validates :username, presence: true
    validates :username, uniqueness: true
    

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.password = SecureRandom.hex(16)
        end
    end
end
