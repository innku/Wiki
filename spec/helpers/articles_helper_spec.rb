require_relative '../../app/helpers/articles_helper'

describe "ApplicationHelper" do
  let!(:helper) { stub.extend ArticlesHelper }

  describe "#can_suscribe?" do
    let (:current_user) { stub }

    it "should return true if articles is new record" do
      article = stub(:new_record? => true)
      helper.can_suscribe?(article, current_user).should be_true
    end

    context "The article is not a new record" do
      it "should return true if the current user is the author" do
        article = stub(:new_record? => false, :user => current_user)
        helper.can_suscribe?(article, current_user).should be_true
      end

      it "should return false if the current user is not the author" do
        article = stub(:new_record? => false, :user => stub)
        helper.can_suscribe?(article, current_user).should be_false
      end
    end
  end
end
