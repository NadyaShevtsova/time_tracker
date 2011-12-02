Feature: I am on  my_profile page
  If I am on my_profile page I can be able to
    change email
    change username
    change password
    change address
    point address
    return beck to home page
    
 @javascript
  Scenario: I can update my email, username, address without filled fields current password, new password, confirmation parrword   
    Given I am "Piter" and I follow "Your profile" within "#link_profile" 
    When I fill in the following:
      | user_email    | piter@piter.com |
      | user_username | new_piter       |
      | user_address  | 2407 Аллисон-авеню, Панама Сити Бич, Флорида 32408, Соединённые Штаты Америки |
    When I press "Update"
    Then I should see "You updated your account successfully." within "#flash_notice"
    And I should see "Signed in as piter@piter.com. Not you?" within "#user_new"
    And I should not see "Set my position" 


   @javascript
  Scenario: I cann't update my profile if fields email and username are empty   
    Given I am "Piter" and I follow "Your profile" within "#link_profile" 
    When I fill in the following:
      | user_email    |           |
      | user_username |           |
      | user_password | new_piter |
      | user_password | new_piter |
    When I press "Update"
    Then I should see the following within "#error_explanation":
      | Email can't be blank                |  
      | Username can't be blank             | 
      | Password doesn't match confirmation |  
      | Current password can't be blank     |  

  
  Scenario: I can return back to homepage  
    Given I am "Piter" and I follow "Your profile" within "#link_profile" 
    When I follow "Back to tasks"
    Then I should see "Your tasks for today" within "h2"
    
