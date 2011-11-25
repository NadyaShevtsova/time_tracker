Feature: I am on  my_profile page
  If I am on my_profile page I can be able to
    change email
    change username
    change password
    change address
    point address
    return beck to home page
    
 @javascript
  Scenario: I can update my email, username without filled fields current password, new password, confirmation parrword   
    Given I am "Piter" and I follow "Your profile" within "#link_profile" 
    And I fill in "user_email" with "piter@piter.com"
    And I fill in "user_username" with "new_piter"
    #    And I fill in "user_address" with "2407 Аллисон-авеню, Панама Сити Бич, Флорида 32408, Соединённые Штаты Америки"
    When I press "Update"
    Then I should see "You updated your account successfully."
    #    Then I should see "Signed in as "piter@piter.com. Not you?"

   #    Then show me the page


