Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |newgame|
  click_on(newgame)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  body.should match(/#{arg1}/m)
end

When(/^I enter the name "(.*?)" in "(.*?)"$/) do |player, field|
  fill_in(field, :with => player)
  click_on("Submit")

end
