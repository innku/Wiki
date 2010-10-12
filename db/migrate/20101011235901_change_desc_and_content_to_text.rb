class ChangeDescAndContentToText < ActiveRecord::Migration
  def self.up
    change_column :articles, :description, :text
    change_column :articles, :content, :text
  end

  def self.down
    change_column :articles, :content, :string
    change_column :articles, :description, :string
  end
end
