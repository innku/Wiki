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

Given /^an article exists$/ do
  new_time = Time.local(2012, 3, 27, 12, 0, 0)
  Timecop.freeze(new_time)
  @article = FactoryGirl.create(:article)
end

Given /^I see the info for the article$/ do
  page.should have_content("IE hate")
  page.should have_content("Las cosas que detestamos de IE")
  page.should have_content("Falta de convenciones")
  page.should have_content("Actualizado el 27 de Mar, 2012")
  Timecop.return
end
