require_relative '../../app/helpers/application_helper'

describe "ApplicationHelper" do
  let!(:helper) { stub.extend ApplicationHelper }

  describe "#get_and_sort_articles" do
    it "should return the articles of the category sorted" do
      article1 = stub(:name => "Elias")
      article2 = stub(:name => "Matheus")
      category = stub(:published => [article2, article1])
      helper.get_and_sort_articles(category).should == [article1, article2]
    end
  end
end
