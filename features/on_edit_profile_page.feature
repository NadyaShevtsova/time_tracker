Feature: I am on  my_profile page
  If I am on my_profile page I can be able to
    change email
    change username
    change password
    change address
    point address
    return beck to home page
    
# @javascript
  Scenario: I can update my email, username without filled fields current password, new password, confirmation parrword   
    Given I am "Piter" and I follow "Your profile" within "#link_profile" 
    And I fill in "user_email" with "piter@piter.com"
    And I fill in "user_username" with "new_piter"
    #    And I fill in "user_address" with "2407 Аллисон-авеню, Панама Сити Бич, Флорида 32408, Соединённые Штаты Америки"
    When I press "Update"
    Then I should see "You updated your account successfully." within "#flash_notice"
    Then I should see "Signed in as piter@piter.com. Not you?" within "#user_new"

    #   Then show me the page


  # @javascript
  Scenario: I cann't update my profile if fields email and username are empty   
    Given I am "Piter" and I follow "Your profile" within "#link_profile" 
    And I fill in "user_email" with ""
    And I fill in "user_username" with ""
    When I press "Update"
    Then I should see "Email can't be blank" within "#error_explanation"
    Then I should see "Username can't be blank" within "#error_explanation"


  Scenario: I cann't change my password if field Password is empty and fields New password and Password confirmation are different   
    Given I am "Piter" and I follow "Your profile" within "#link_profile" 
    And I fill in "user_password" with "new_piter"
    And I fill in "user_password_confirmation" with "another_piter"
    When I press "Update"
    Then I should see "Password doesn't match confirmation" within "#error_explanation"
    Then I should see "Current password can't be blank" within "#error_explanation"


