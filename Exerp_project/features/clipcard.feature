
 @javascript

 # Feature : https://projects.skilld.cloud/skilld/exerp-wlp/wikis/exerp-wlp/functional/theme/monetization/epic/services/feature/membership

 Feature: Checkout flow success

 Scenario: Clipcard checkout flow

      #Step 1
      Given I am an anonymous user
      When I am on "/user/login"
      And I fill in "edit-name" with "exerp-mgmt.skilld@yopmail.com"
      And I fill in "edit-pass" with "ok"
      And I press the "edit-submit" button
      And I visit "/clipcard-list"
      Then I should see the text "Select product"


      #Step 2
      And I click the "#products-wrapper .form-item-clipcard:nth-child(1)" element
      And I wait for AJAX to finish
      And I press the "Next" button
      Then I should see the text "Summary"

      #Step 3
      And I press the "Proceed to payment" button
      Then I should see the text "Please select your payment method"

      #Step 4
      And I fill in "card.cardNumber" with "4166 6766 6766 6746"
      And I fill in "card.cardHolderName" with "Test User"
      And I fill in "card.expiryMonth" with "03"
      And I fill in "card.expiryYear" with "2030"
      And I fill in "card.cvcCode" with "737"
      And I press the "pay" button
      And I wait for AJAX to finish
      Then I should see the text "Thank you, your purchase is completed."
      Then I should see the text "The payment authorisation was successfully completed."
      And I take a screenshot
