Feature: Registration

Background: Open application and select registration option 

Given I open the demoqa page
When I select Registration option
Then I should see "Registration" title displayed

@Registration1
Scenario: UI validation
When I click on Submit button
Then I should see 7 validation messages with "* This field is required"
When I fill the Passenger Information fields in New Request screen
	|First Name |Virginia|
	And I click on Submit button
Then I should see 6 validation messages with "* This field is required"	
When I fill the Passenger Information fields in New Request screen
	|Password |Sanabria|
	And I click on Submit button
Then I should see 5 validation messages with "* This field is required"	

@Registration2
Scenario: Register a valid user
When I fill the Passenger Information fields in New Request screen
	|First Name  	 |Virginia2     |
	|Last Name   	 |Sanabria2     |
	|Reading      	 |checked       |
	|Phone Number	 |591123456782  |
	|Username    	 |vsnabria2     |
	|E-mail      	 |uno1@gmail.com|
	|Password    	 |Administr@tor123?|
	|Confirm Password|Administr@tor123?|
	And I click on Submit button
Then I should see notification message "Thank you for your registration"			
	And I should see the entered Passenger information
 		|First Name  	 |Virginia2     |
		|Last Name   	 |Sanabria2     |
		|Reading      	 |checked       |
		|Phone Number	 |591123456782  |
		|Username    	 |vsnabria2     |
		|E-mail      	 |uno1@gmail.com|
		|Password    	 |              |
		|Confirm Password|              |
	
@Registration3
Scenario: Try to regiter a duplicate user
When I fill the Passenger Information fields in New Request screen
	|First Name  	 |Maria        |
	|Last Name   	 |Cespedes      |
	|Reading      	 |checked       |
	|Phone Number	 |59112345676   |
	|Username    	 |mcespedes     |
	|E-mail      	 |test20@gmail.com|
	|Password    	 |Administr@tor123?|
	|Confirm Password|Administr@tor123?|
	And I click on Submit button
	And I fill the Passenger Information fields in New Request screen
		|First Name  	 |Maria        |
		|Last Name   	 |Cespedes      |
		|Reading      	 |checked       |
		|Phone Number	 |59112345676   |
		|Username    	 |mcespedes     |
		|E-mail      	 |test20@gmail.com|
		|Password    	 |Administr@tor123?|
		|Confirm Password|Administr@tor123?|
	And I click on Submit button	
Then I should see notification message "Error: Username already exists"	