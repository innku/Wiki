class Article < ActiveRecord::Base
  
  acts_as_taggable
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  belongs_to :category
  belongs_to :user
  validates  :name, :user, :presence => true
  validates  :content, :description, :category, :presence => { :if => :published? }
  
  scope :published, where({:published => true})
    
  def increase_count!
    self.hit_count += 1  
    self.save!
  end
  
  def self.search(query)
    if query.blank?
      self.all
    else
      conditions = []
      conditions << sanitize_sql(["articles.name #{$like} ?", "%#{query}%"])
      conditions << sanitize_sql(["articles.description #{$like} ?", "%#{query}%"])
      conditions << sanitize_sql(["articles.content #{$like} ?", "%#{query}%"])
      tags_conditions = sanitize_sql(["tags.name #{$like} ?", "%#{query}%"])
      conditions << "articles.id IN (SELECT taggings.taggable_id FROM taggings JOIN tags ON taggings.tag_id = tags.id AND (#{tags_conditions}) WHERE taggings.taggable_type = 'Article')"
      where(conditions.join(" OR ")).published
    end
  end
  
  def publish!
    self.published = true
    self.save!
  end
  
  def published?
    self.published
  end
 
end
