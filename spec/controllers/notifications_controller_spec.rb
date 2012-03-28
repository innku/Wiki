require 'spec_helper'

describe NotificationsController do
  include Devise::TestHelpers

  before do
    @user = Factory(:user)
    sign_in @user
  end

  describe "GET 'deliver'" do
    let (:mail) { stub }

    it "should deliver a notification to the author if suscribed" do
      art = Factory(:article, :author_suscribed => true, :user => @user)
      NotificationMailer.stub!(:notify_author).with(art).and_return(mail)
      mail.should_receive(:deliver)
      get 'deliver', :article_id => art.id
    end

    it "shouldnt deliver the notification to the author if not suscribed" do
      art = Factory(:article, :author_suscribed => false, :user => @user)
      NotificationMailer.should_not_receive(:notify_author).with(art)
      get 'deliver', :article_id => art.id
    end
  end
end
