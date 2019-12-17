class User < ApplicationRecord
    validates :email, :password_digest, presence: true 
    validates :email, :session_token, uniqueness: true
    validates :email, :password, length: { minimum: 6 }, allow_blank: false  

    attr_reader :password 

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(@password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless user && user.is_password?(password)
        user 
    end 

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end 
end
