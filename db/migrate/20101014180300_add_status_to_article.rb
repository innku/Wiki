class AddStatusToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :published, :boolean, :default => false
    
    Article.all.each do |article|
      article.publish!
    end
  end

  def self.down
    remove_column :articles, :status
  end
end
