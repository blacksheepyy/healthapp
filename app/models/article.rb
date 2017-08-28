class Article <ActiveRecord::Base
    
    validates :score, presence: true
    #validates :comment
    #validates :user_id, presence: true
    
end