@api

Feature: Generic tests


  Scenario: Homepage is accessible
    Given I am an anonymous user
    When I am on the homepage
    Then I should get a "200" HTTP response


  Scenario: User login page is accessible
    Given I am an anonymous user
    When I visit "/user"
    Then I should get a "200" HTTP response


  Scenario: Submit valid credentials as admin user login
    Given I am an anonymous user
    When I visit "/user"
    And I fill in "edit-name" with "admin"
    And I fill in "edit-pass" with "admin"
    And I press the "edit-submit" button
    Then I am on "/admin/people"
    And the response status code should be 200


  Scenario: Submit invalid credentials as admin user login
    Given I am an anonymous user
    When I visit "/user"
    And I fill in "edit-name" with "XXXXX"
    And I fill in "edit-pass" with "YYYYY"
    And I press the "edit-submit" button
    Then I am on "/admin/people"
    And the response status code should be 403


  Scenario: Create many nodes
    Given "basic_page" content:
    | title    |
    | Page one |
    | Page two |
    And I am logged in as a user with the "administrator" role
    When I go to "admin/content"
    Then I should see "Page one"
    And I should see "Page two"


  Scenario: Target links within table rows
    Given I am logged in as a user with the "administrator" role
    When I am at "admin/structure/menu"
    And I click "Modifier le menu" in the "Administration" row
    Then I should be on "/fr/admin/structure/menu/manage/admin"
    And I should see text matching "Modifier"


  Scenario: Create and view a node with fields
    Given I am viewing an "basic_page" content:
    | title | My node with fields! |
    | description  | A placeholder |
    Then I should see the text "A placeholder"


  Scenario: Create users
    Given users:
    | name     | mail            | status |
    | John Doe | johndoe@example.com | 1 |
    And I am logged in as a user with the "administrator" role
    When I visit "/admin/people"
    Then I should see the text "John Doe"


  Scenario: Run cron
    Given I am logged in as a user with the "administrator" role
    When I run cron
    And am on "admin/reports/dblog"
    Then I should see the link "Cron run completed"


  Scenario: Clear cache
    Given the cache has been cleared
    When I am on the homepage
    Then I should get a "200" HTTP response
