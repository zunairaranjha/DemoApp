class Post < ApplicationRecord
  validates :content, presence: true, length: { minimum: 1 }
  validates :title, presence: true, length: { minimum: 1 }

    belongs_to :user
    has_many :reviews
    
    

    # validate :date_scope

    # private
    #   def date_scope
    #     if Post.where("user_id = ? AND DATE(created_at) = DATE(?)", self.user_id, Time.now).all.any?
    #       errors.add(:user_id, "Can only post once a day")
    #     end
    #   end
end
