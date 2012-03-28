class AddAuthorSuscribedToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :author_suscribed, :boolean, :default => true
  end

  def self.down
    remove_column :articles, :author_suscribed
  end
end
