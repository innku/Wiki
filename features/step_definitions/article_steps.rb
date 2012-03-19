Given /^a draft created by that user exists$/ do
  FactoryGirl.create(:draft, :name => "Algun nombre", :user => @current_user)
end

Given /^a draft created by another user exists$/ do
  FactoryGirl.create(:draft, :name => "Algun otro nombre")
end

Then /^I see the info for both articles$/ do
  page.should have_content("Algun nombre")
  page.should have_content("Algun otro nombre")
end
