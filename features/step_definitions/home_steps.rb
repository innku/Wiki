Given /^three new and two old articles exists$/ do
  3.times do |n|
    FactoryGirl.create(:article, :name => "La nueva #{n}")
  end
  2.times do |n|
    FactoryGirl.create(:article, 
                       :name => "La vieja #{n}", 
                       :created_at => Date.yesterday)
  end
end

Then /^I see the info for only the new articles in the main section$/ do
  within "div#yui-main" do
    3.times do |n|
      page.should have_content("La nueva #{n}")
    end
    2.times do |n|
      page.should_not have_content("La vieja #{n}")
    end
  end
end
