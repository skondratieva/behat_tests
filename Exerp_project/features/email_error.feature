@api @javascript

#Feature : https://projects.skilld.cloud/skilld/exerp-wlp/wikis/exerp-wlp/functional/theme/monetization/epic/services/feature/membership

Feature: Errors (email)

Background:

    Given I am an anonymous user

    #Step 1
    And I visit "/checkout-initiate"

    #Step 2
    And I select in choices "#edit-subscription-custom-gym-container-center" element number "1"
    And I press the "Go to select plan and package" button

   #Step 3
    Then I should see the text "Select your plan"


Scenario: Wrong format of email field

    And I select "1" from "subscription_custom_plan_package[plan]"
    And I wait for AJAX to finish
    And I should see the text "Select your plan"
    And I click the "#products-wrapper .form-item-subscription-custom-plan-package-products-package:nth-child(1)" element
    And I wait for AJAX to finish
    And I press the "Next" button

    #Step 4
    And I fill in "Email Address" with "qwerty"
    Given set a random text with length "15" in "%first_name%" placeholder
    Then I should see the text "Email Address does not contain a valid email."
    And I take a screenshot
