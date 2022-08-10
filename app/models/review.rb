class Review < ApplicationRecord
    belongs_to :post
    belongs_to :user
    
# validate :rating, prsesnce: true
#validate :comment, presence: true, lenght: { minimum: 5 } 
end
   