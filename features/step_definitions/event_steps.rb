Given /^there exists an event$/ do
  @event = FactoryGirl.create(:event, user: @user)
end

Given /^there exists an event with the name "(.*?)"$/ do |name|
  @event = FactoryGirl.create(:event, name: name, user: @user)
end

When /^I add the first question in the list$/ do
  #page.find(:css, ".add_question_link").click does not work with webkit due to webkit bug
  find(:css, "a.add_question_link").trigger("click")
end

When /^I click Delete survey$/ do
  find(:xpath, '//a[@title="Delete survey"]').trigger("click")
end

When /^I click delete$/ do
  click_link "delete"
end

Then /^there should be a li with class=collaborators__item$/ do
  page.should have_xpath('//li[@class="collaborators__item"]')
end
Then /^there should be an hex-number as data-id$/ do
  page.find(:xpath, '//li[@class="collaborators__item"]/a')["data-id"].should match Regexp.new(/[0-9a-fA-F]{24}/i)
end

Then /^I should see that the mail does not exists$/ do
  page.should have_content "There is no user with this email address. Please try again with a different email."
end
