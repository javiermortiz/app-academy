class User < ApplicationRecord
    validates :user_name, :password_digest, :session_token, presence: true
    after_initialize :ensure_session_token!

    has_many :cats,
      class_name: :Cat,
      primary_key: :id,
      foreign_key: :user_id

    has_many :rental_requests,
        class_name: :CatRentalRequest,
        primary_key: :id,
        foreign_key: :user_id 

    def self.find_by_credentials(username, password)
        user = User.find_by(user_name: username)
        return nil unless user && user.is_password?(password)
        user
    end

    def ensure_session_token!
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        bcrypt_digest = BCrypt::Password.new(self.password_digest)
        bcrypt_digest.is_password?(password)
    end
end