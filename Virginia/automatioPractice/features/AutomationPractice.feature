Feature: Automation practice

Background: Open automation screen

Given I open automation page

@Automation1
Scenario: Navigation Menu
When I click on DRESSES main menu options
Then I should see Navigation menu with option Dresses
	And I should see the option selected displayed in :
		|Category title |
		|Main Screem    |

@Automation2
Scenario: Search an invalid keyword
When I enter keyword "anyyword" in search texbox
   And I click on search button in header section
Then I should see the notification message "No results were found for your search "anyyword""
	And I should see the search title should start with "SEARCH 0"

@Automation3
Scenario: Search a valid keyword
When I enter keyword "casual" in search texbox
	And I click on search button in header section
Then I should see the search title should start with "SEARCH "CASUAL""
When Select view "Grid"	
Then I should see the "Grid" view displayed
When Select view "List"	
Then I should see the "List" view displayed
