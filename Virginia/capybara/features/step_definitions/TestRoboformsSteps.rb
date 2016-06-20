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
      actualValue = page.find_field('14adrstate').value
      puts "Selecttt: #{actualValue}" 
 	  end
  end
end

When(/^Click on reset button$/) do
  page.click_button('Reset')
end

Then(/^Verify all fields are empty$/) do |table|
	@result = table.hashes
  @result.each do |hash|
	 key = hash['field'].to_s
   expectedValue = hash['value']
   #actualaValue =page.find_field('02frstname').text
   case key
     when "First Name" then actualValue = page.field_labeled('02frstname').text 
     when "Last Name" then actualValue = page.field_labeled('04lastname').text
     when "Address1" then actualValue = page.field_labeled('10address1').text
     when "Address2" then actualValue = page.field_labeled('10address2').text 
     when "City" then actualValue = page.field_labeled('13adr_city').text
     #when "State" then actualValue = page.find('14adrstate',:value=>"").text
     when "State" then actualValue = page.find_field('14adrstate').find('option[value=""]').text
     	
    end
   puts "expected: #{actualValue}"  
   expect(actualValue).to eq(expectedValue)
  end 
  
end
