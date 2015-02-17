Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |newgame|
  click_on(newgame)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  body.should match(/#{arg1}/m)
end