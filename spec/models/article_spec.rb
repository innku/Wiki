require 'spec_helper'

describe "Article" do
  describe "#most_recent" do
    it "should return the 2 most recent articles" do
      new_category = FactoryGirl.create(:article, :name => "La nueva")
      FactoryGirl.create(:article, 
                         :name => "La vieja", 
                         :created_at => Date.yesterday)
      Article.most_recent(1).should == [new_category]
    end
  end
end
