class Category < ActiveRecord::Base
  
  has_many  :articles, :order => "name ASC"
  has_many  :published, :conditions => {:published => true}, :class_name => "Article"
  has_many  :drafts, :conditions => {:published => false}, :class_name => "Article"
  
  default_scope order("name ASC")
end
