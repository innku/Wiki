Given /^a category exists$/ do
  @category = FactoryGirl.create(:category, :name => "Rant")
end
