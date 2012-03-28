Given /^I am on that user page$/ do
  visit user_path(@current_user)
end

Given /^I am on the home page$/ do
  visit root_path
end

Given /^I am on the article page$/ do
  visit article_path(@article)
end

Given /^I am on the new article page$/ do
  visit new_article_path
end

Given /^I am on the edit article page for that article$/ do
  visit edit_article_path(@article)
end
