Given /^I am on that user page$/ do
  visit user_path(@current_user)
end

Given /^I am on the home page$/ do
  visit root_path
end
