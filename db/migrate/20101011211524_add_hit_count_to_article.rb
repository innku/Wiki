class AddHitCountToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :hit_count, :integer, :default => 0
  end

  def self.down
    remove_column :articles, :hit_count 
  end
end
