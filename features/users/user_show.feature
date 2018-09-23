Feature: Show Users
  As a admin to the website
  I want to see registered users listed on the admin page
  so I can know if the site has users

    Scenario: Viewing users
      Given I am Admin
      Then I should see "Admin"
      When I look at the list of users
      Then I should see a list of users

    Scenario: Updating user
      Given the user with email "test_updater@example.com" exists
      And I am Admin
      When I visit the user's admin page
      Then I should see "test_updater@example.com"
      When I edit the user's account details
      Then I should see "User was successfully updated."
      When I look at the list of users
      Then I should see the updated account details

    Scenario: Updating user's password
      Given the user with email "test_updater@example.com" exists
      And I am Admin
      When I visit the user's admin page
      Then I should see "test_updater@example.com"
      When I edit the user's password
      Then I should see "User was successfully updated."
      When I sign out
      And I log in as the user with email "test_updater@example.com"
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: Creating user
      Given I am Admin
      When I visit the Admin's user creation page
      And I fill out the user creation page
      Then I should see "User was successfully created."
      When I sign out
      And I log in as the user with email "admincreated@example.com"
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: Creating user without input
      Given I am Admin
      When I visit the Admin's user creation page
      And I fill out nothing in the user creation page
      Then I should see "Email can't be blank"
      And I should see "Password can't be blank"
      And I should see "First name can't be blank"
      And I should see "Last name can't be blank"
      And I should see "Faculty can't be blank"
      And I should see "Organization can't be blank"
