require 'spec_helper'

describe "Category" do
  describe "with_published_articles" do
    it "should return the categories with at least one published article" do
      category_without_article = Factory(:category)
      category_with_a_draft    = Factory(:draft).category
      category_with_article    = Factory(:article).category

      Category.with_published_articles.should == [category_with_article]
    end
  end
end
