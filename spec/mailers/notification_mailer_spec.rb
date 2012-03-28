require 'spec_helper'

describe "NotificationMailer" do
  describe "notify_author" do
    it "should render successfully" do
      article = Factory(:article)
      lambda { NotificationMailer.notify_author(article).deliver }.
        should_not raise_error
    end
  end
end
