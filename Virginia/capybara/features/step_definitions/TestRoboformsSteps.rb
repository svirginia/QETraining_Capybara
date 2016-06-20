Given(/^Navigate to robotform page$/) do
  visit 'http://www.roboform.com/filling-test-shopping-cart' 
end

When(/^Fill fields$/) do |table|
  @board = table.hashes

  puts "Hassss: #{@board}"

  @board.each do |hash|
  	#puts "HASH: #{hash}"
   #puts "KEY= #{key} points to VALUE= #{value}\n"
   	#puts "print key: hash['field']  and value hash['value'] "
   	values = hash.values
   	keys = hash.keys
   	#puts "print hasss: #{keys}  and value #{values}"

   	key = hash['field'].to_s
   	value = hash['value']
   	puts "print key: #{key}  and value #{value}"

   	case key
 		when "First Name" then page.fill_in '02frstname', :with => value   
 		when "Last Name" then page.fill_in '04lastname', :with => value 
 		when "Address1" then page.fill_in '10address1', :with => value 
 		when "Address2" then page.fill_in '10address2', :with => value  
 		when "City" then page.fill_in '13adr_city', :with => value 
 		when "State" then page.select value, :from => '14adrstate'
 	end

  end

end

When(/^Click on reset button$/) do
  page.click_button('Reset')
end

Then(/^Verify all fields are empty$/) do |table|
	 @result = table.hashes
	 key = hash['field'].to_s
   	 expectedValue = hash['value']
	
  
end
