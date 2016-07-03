Given(/^I open the search page$/) do
  visit('http://www.google.com')
end

When(/^I set the search phrase "(.*?)"$/) do |phrase|
  google_Page.fill_Text_Box(phrase)
end

When(/^I click on button "(.*?)"$/) do |button_name|
  google_Page.click_button(button_name)
end

Then(/^I should see the result "(.*?)"$/) do |result_expected|
  expect(google_Page.is_result_displayed(result_expected)).to be true
end