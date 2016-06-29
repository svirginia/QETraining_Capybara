When(/^I select (.*?) option$/) do |menu|
  page.find('.menu',:text => menu).click
end

Then(/^I should see "(.*?)" title displayed$/) do |main_title|
  expect(page.find('h1').text).to eql main_title
end

When(/^I click on (.*?) button$/) do |button_name|
  page.click_button button_name
end

Then(/^I should see (\d+) validation messages with "(.*?)"$/) do |number_of_times, message_displayed|
  page.assert_text(message_displayed, :count => number_of_times)
end

When(/^I fill the Passenger Information fields in New Request screen$/) do |table|
  values = table.rows_hash
   values.each_pair do |label, text|
  	Helpers.fill_Passenger_Fields(label, text)
  end
end

Then(/^I should see notification message "([^"]*)"$/) do |notification_message|
  #page.assert_text(notification_message)
  actual_notification = page.find('p[class ^= "piereg"]').text
  expect(actual_notification).to eq(notification_message)
end

 Then(/^I should see the entered Passenger information$/) do |table|
  values = table.rows_hash
   values.each_pair do |label, text|
   	field_found = page.find('label',:text => /^#{label}$/).find(:xpath, './/following-sibling::input[1]')
    if label == "Reading" || label == "Cricket" || label == "Dance"
    	valueField = field_found.value
			puts "comparevalue input : #{valueField}"
			if text == "checked"
				expect(field_found).to be_checked 
			else
				#TODOask karime
				expect(field_found).to_not be_checked
			end

    else
    	textValue = field_found.value
    	expect(textValue).to eq(text)
    end
   end
 end