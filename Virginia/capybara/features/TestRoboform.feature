Feature: Test robo form page

Scenario: Fill robot form
Given Navigate to robotform page
When Fill fields
|field     |value       |
|First Name|virginia    |
|Last Name |sanabria    |
|Address1  |quillacollo |
|Address2  |quillacollo2|
|City      |Cbba        |
|State     |ALASKA		|
When Fill fields
|field     |value       |
|First Name|virginia2    |
|Last Name |sanabria2    |
|Address1  |quillacollo2 |
|Address2  |quillacollo3 |
|City      |lapas        |
|State     |IOWA	     |
When Click on reset button
Then Verify all fields are empty
|field     |value       |
|First Name|            |
|Last Name |            |
|Address1  |            |
|Address2  |            |
|City      |            |
|State     |            |