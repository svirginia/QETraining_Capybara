Given(/^I open the demoqa page$/) do
    visit('http://demoqa.com/')
    page.driver.browser.manage.window.maximize
end

Then(/^I should see the navigation tabs$/) do |navigationTabs|
	data = navigationTabs.raw 
	data.each do |row|
        expect(page.has_xpath?('//ul[@id="menu-primary-menu"]//li[contains(@id,"menu-item")]/a',:text => row.first)).to be true
   end
end

Then(/^I should see the "([^"]*)" module title with its options$/) do |moduleTitle, options|
	optionTexts = options.raw
	expect(page.has_css?('.panel-heading h3',:text => moduleTitle)).to be true
	optionTexts.each do |option|
		expect(page.has_xpath?('//div[@class = "panel-heading"][contains(., "' +moduleTitle+'")]//following-sibling::div//a',:text => option.first)).to be true
	end
end

Then(/^I should see the tabs$/) do |tabs|
  tabNames = tabs.raw
  tabNames.each do |tabName|
  	expect(page.has_css?('a[id ^="ui-id"]',:text => tabName.first)).to be true
  end
end

When(/^Clik on "([^"]*)" tab$/) do |tabName|
  page.find('a[id ^="ui-id"]',:text => tabName).click
end

Then(/^I should see the "([^"]*)" content title$/) do |contentTitle|
  expect(page.find('div[class ^= "tabcontent"][style *= "block"] b').text).to eq(contentTitle)
end