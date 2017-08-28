class User < ActiveRecord::Base
    has_many :articles #, dependent: :destroy
    before_save {self.email = email.downcase }
    validates :username, presence:true, length: {minimum:3, maximum:25}, 
                uniqueness: {case_sensitive: false}
    
    validates :linemanager, presence:true
    
    VALID_EMAIL_REGEX= /([A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4})/i
    validates :email, presence: true, length: {maximum: 105},
                uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX }
    
    has_secure_password
end