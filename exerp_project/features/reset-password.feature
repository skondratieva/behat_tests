@javascript



    Feature: Reset password

     Scenario: Fill the forgotten password form

     #Step 1
     Given I visit "/user"
     And I click the "#edit-reset" element

     #Step 2
     Then I should see "Password reset instructions will be sent to your registered email address."
     And I fill in "Email address" with "exerp-mgmt.skilld@yopmail.com"
     And I click the "#edit-submit" element

     #Step 3
     Then I should see "Further instructions have been sent to your email address."
