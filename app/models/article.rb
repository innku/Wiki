class Article < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :user
  validate :content,:description,:category,:user, :presence => true
 
end
