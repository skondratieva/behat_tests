@api @javascript

# Feature : https://projects.skilld.cloud/skilld/exerp-wlp/wikis/exerp-wlp/functional/theme/monetization/epic/services/feature/membership

Feature: Checkout flow success (order for DK country)

Background:

    Given I am an anonymous user

    #Step 1
    And I visit "/checkout-initiate"
    Then I take a screenshot

    #Step 2
    And I select in choices "#edit-subscription-custom-gym-container-center" element number "10"
    And I press the "Go to select plan and package" button
    #Step 3
    Then I should see the text "Select your plan"


Scenario: Completion of order for DK country


    And I select "0" from "subscription_custom_plan_package[plan]"
    And I wait for AJAX to finish
    And I should see the text "Select your plan"
    And I click the "#products-wrapper .form-item-subscription-custom-plan-package-products-package:nth-child(1)" element
    And I wait for AJAX to finish
    And I press the "Next" button

    #Step 4
    Given set a random mail in "%email%" placeholder
    Given set a random text with length "15" in "%first_name%" placeholder
    And I fill in "Email Address" with "%email%"
    And I fill in "Password" with "ok"
    And I fill in "Confirm password" with "ok"
    And I select "Miss" from "subscription_custom_details[civility]"
    And I fill in "First Name" with "%first_name%"
    And I fill in "Last Name" with "Test1"
    And I fill in "Mobile Number" with "+380666457082"
    And I select in choices "#edit-subscription-custom-details-country" element number "2"
    Then I should see "Denmark"
    And I fill in "Zip Code" with "2200"
    And I fill in "Address 1" with "27 rue des fleurs"
    And I click the "#edit-subscription-custom-details-zip" element
    And I select "MALE" from "subscription_custom_details[gender]"
    And I wait 15 seconds until element ".form-item-subscription-custom-details-city-wrapper-city select" appears
    And I select in choices ".form-item-subscription-custom-details-city-wrapper-city select" element number "1"
    And I check "subscription_custom_details[terms_and_conditions]"
    And I wait 5 seconds
    And I press the "Next" button


    #Step 5
    Then I should see the text "Payment information"
    And I wait for AJAX to finish
    And I select "bank_transfer" from "exerp_payment_information[payment_method]"
    And I wait for AJAX to finish
    And I fill in "Account number" with "1234567890"
    And I fill in "Registration number" with "12345"
    And I fill in "IBAN" with "FR7630001007941234567890185"
    And I press the "Next" button
    Then I should see the text "Please select your payment method"
    And I fill in "card.cardNumber" with "4166 6766 6766 6746"
    And I fill in "card.cardHolderName" with "Test User"
    And I fill in "card.expiryMonth" with "10"
    And I fill in "card.expiryYear" with "2020"
    And I fill in "card.cvcCode" with "737"
    And I press the "pay" button
    And I wait for AJAX to finish
    Then I should be on "/class/booking"
    And I should see "Timetable"
    And I take a screenshot
