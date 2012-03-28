# encoding: utf-8

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
  @article = FactoryGirl.create(:article)
end

Given /^I fill the article form$/ do
  fill_in :article_name, :with => "Java sucks"
  fill_in :article_description, :with => "Many reasons why java sucks"
  fill_in :article_content, :with => "Ceremony, ceremony, ceremony"
  select "Rant", :from => "article_category_id"
  click_button "Guardar Borrador"
end

Given /^I see the info for the article$/ do
  page.should have_content("IE hate")
  page.should have_content("Las cosas que detestamos de IE")
  page.should have_content("Falta de convenciones")
  page.should have_content("Creado el 27 de Mar, 2012")
end

Given /^the article should have been created$/ do
  page.should have_content("El artículo fue creado exitosamente")
end

Given /^I have created an article$/ do
  @article = FactoryGirl.create(:article, :user => @current_user)
end

Then /^I try to suscribe to the article comments$/ do
  check :article_author_suscribed
  click_button "Guardar Borrador"
end

Given /^the article should have been updated$/ do
  page.should have_content("El artículo fue modificado exitosamente")
end
