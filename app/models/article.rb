class Article <ActiveRecord::Base
    belongs_to :user
    validates :score, presence: true
    validates :user_id, presence: true
    validates :user_linemanager, presence: true
    #validates :comment
    #validates :user_id, presence: true
    
end