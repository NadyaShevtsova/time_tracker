Feature: Entrance to homepage
  Ican be able to enter to homepage via form sign-in, sign-up, via facebook and twitter 

  Scenario: Entrance on site  if I have no account
    Given I am on the home page
    And I should see "You need to sign in or sign up before continuing."
    And I fill in "Username" with "user1"
    And I fill in "Password" with "user1"
    When I press "Sign in" 
    Then I should see "Invalid email, username or password."

  Scenario: Entrance on site  if I has been registrated olready
    Given I have 1 user in the system

#    Then show me the page

    And I fill in "Username" with "user"
    And I fill in "Password" with "user"
    When I press "Sign in" 
    Then I should see "Signed in successfully."


  Scenario: Entrance on site via form sign-up
    Given  I am on the home page
    When I follow "Sign up"
    Then I should see "Sign up"
    And I fill in "Email" with "test@gmail.com"
    And I fill in "Username" with "test"
    And I fill in "Password" with "test"
    And I fill in "Password confirmation" with "test"
    When I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
#    Then show me the page


