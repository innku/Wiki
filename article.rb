class Article < ActiveRecord::Base
  
  acts_as_taggable_on 
  
  belongs_to :category
  belongs_to :user
  validate :content,:description,:category,:user, :presence => true
 
end
