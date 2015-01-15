class Interest < ActiveRecord::Base

  has_one :user, through: :profile 
  serialize :subreddits
  
end
