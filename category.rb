class Category < ActiveRecord::Base
  
  has_many  :articles, :order => "name ASC"
end
