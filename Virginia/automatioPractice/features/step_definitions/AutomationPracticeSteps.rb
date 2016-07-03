Given(/^I open automation page$/) do
  visit('http://automationpractice.com')
  page.driver.browser.manage.window.maximize
end

When(/^I click on (.*?) main menu options$/) do |menu|
	p "menu:#{menu}"
	p page.find('#block_top_menu').text
	page.find('#block_top_menu').find('li',:text => menu).click  #TODO ask to Karime

	# p page.all(:xpath,'//div[@id = "block_top_menu"]//ul[contains(@class, "sf-menu")]/li/a')[0].text
	# p page.all(:xpath,'//div[@id = "block_top_menu"]//ul[contains(@class, "sf-menu")]/li/a')[1].text
	# p page.all(:xpath,'//div[@id = "block_top_menu"]//ul[contains(@class, "sf-menu")]/li/a')[2].text

	# p page.find('#block_top_menu').all('li')[0].text
	# p page.find('#block_top_menu').all('li')[1].text
	# p page.find('#block_top_menu').all('li')[2].text
	# #page.all(:xpath,'//div[@id = "block_top_menu"]//ul[contains(@class, "sf-menu")]/li/a').first.click
	@option_selected=menu
end

Then(/^I should see Navigation menu with option (.*?)$/) do |option|
	p page.find('.breadcrumb').text
  expect(page.find('.breadcrumb').text).to include option
end

Then(/^I should see the option selected displayed in :$/) do |navigation_options|
  options = navigation_options.raw
  options.each do |side|
      case side.first
  			when "Category title"
  				p "CAAA:"
  				screen=page.find('h2')
  					#screen=page.find('#left_column h2')
  			when "Main screen"
  				p "Mmma:"
  					screen=page.find('h1').all('span').first
  		end
  		expect(screen.text).to eq @option_selected
  end
end

When(/^I enter keyword "(.*?)" in search texbox$/) do |keyword|
  page.fill_in 'search_query_top', :with => keyword
end

When(/^I click on search button in header section$/) do
  page.find('button[name = "submit_search"]').click
end

Then(/^I should see the notification message \"(.*)\"$/) do |notification_message|
  expect(page.find('.alert.alert-warning').text).to eq(notification_message)
end

Then(/^I should see the search title should start with \"(.*)\"$/) do |search_title|
  expect(page.find('.page-heading.product-listing').text).to start_with(search_title)
end

When(/^Select view "([^"]*)"$/) do |view|
  page.find(:xpath, '//li[text()="View"]/following-sibling::li',:text => view).click
end

Then(/^I should see the "([^"]*)" view displayed$/) do |view|
  if view == "Grid"
    expect(page.has_xpath?('//li[@id = "grid"][@class="selected"]')).to be true
    expect(page.has_css?('.product_list.grid.row')).to be true
  else
    expect(page.has_xpath?('//li[@id = "list"][@class="selected"]')).to be true
    expect(page.has_css?('.product_list.row.list')).to be true
  end
end