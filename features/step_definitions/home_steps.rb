Given /^four new articles exists, three published and one draft$/ do
  3.times do |n|
    FactoryGirl.create(:article, :name => "La nueva #{n}")
  end
  FactoryGirl.create(:draft, :name => "El borrador")
end

Given /^two old articles exists$/ do
  2.times do |n|
    FactoryGirl.create(:article, 
                       :name => "La vieja #{n}", 
                       :created_at => Date.yesterday)
  end
end

Then /^I see the info for only the new published articles in the main section$/ do
  within "div#yui-main" do
    3.times do |n|
      page.should have_content("La nueva #{n}")
    end
    page.should_not have_content("El borrador")
    2.times do |n|
      page.should_not have_content("La vieja #{n}")
    end
  end
end
