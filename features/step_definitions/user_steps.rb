Given /^I am logged in as user "(.*)"$/ do |email|
  @current_user = FactoryGirl.create(:user, :email => email)
  visit '/users/sign_in'
  fill_in("user_email", :with => email)
  fill_in("user_password", :with => 'secret')
  click_button("Entrar")
end
