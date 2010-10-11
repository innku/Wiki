class Article < ActiveRecord::Base
  
  acts_as_taggable
  
  belongs_to :category
  belongs_to :user
  validate :content,:description,:category,:user, :presence => true
  
  def increase_count!
    self.hit_count += 1  
    self.save!
  end
  
  
 
end
