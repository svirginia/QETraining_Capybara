Feature: Demoqa elements 

@tag1
Scenario: UI validations
Given I open the demoqa page
Then I should see the navigation tabs
|Home    |
|About us|
|Services|
|Demo    |
|Blog    |
|Contact |
Then I should see the "Registration" module title with its options
|Registration|
  And I should see the "interaction" module title with its options
  	|Draggable |
  	|Droppable |
	|Resizable |
	|Selectable|
	|Sortable  |
  And I should see the "Widget" module title with its options
	|Accordion    |
	|Autocomplete |
	|Datepicker   |
	|Menu         |
	|Slider       |
	|Tabs         |
	|Tooltip      |
  And I should see the "Frames and Windows" module title with its options
	|Frames and windows |

@tag2
Scenario: Navigation tabs 
Given I open the demoqa page
Then I should see the tabs
|Tab 1|
|Tab 2|
|Tab 3|
|Tab 4|
|Tab 5|
When Clik on "Tab 1" tab
Then I should see the "Content 1 Title" content title
When Clik on "Tab 2" tab
Then I should see the "Content 2 Title" content title
When Clik on "Tab 3" tab
Then I should see the "Content 3 Title" content title
When Clik on "Tab 4" tab
Then I should see the "Content 4 Title" content title
When Clik on "Tab 5" tab
Then I should see the "Content 5 Title" content title
