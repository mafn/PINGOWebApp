Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    Scenario: I sign in and edit my account
      Given I am logged in
      When I edit my account details
      Then I should see an account edited message

    Scenario: I sign in and change my password with wrong old one
      Given I am logged in
      When I change my password and use wrong old password
      Then I should see an current password is invalid message

    Scenario: I sign in and change my password with wrong confirmation
      Given I am logged in
      When I change my password and use wrong password confirmation
      Then I should see a mismatched password message

    Scenario: I sign in and change my password
      Given I am logged in
      When I change my password
      Then I should see a password changed message
      When I sign out
      And I sign in with valid credentials
      Then I see an invalid login message
      And I should be signed out
      When I sign in with my new credentials
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in
