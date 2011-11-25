Feature: I am admin and I am on  home page
  If I am on home page I can be able to
    create new task
    edit existing task
    delete existing task
    select next page or specific page
    select Number items on page
    follow to my profile
    view report for specific week if I am admin
    review reports for week


  Scenario: I am admin and I follow to week (2011/10/31 - 2011/11/06) 
    Given I am "admin" and I follow "week (2011/11/28 - 2011/12/04)"
    And I should see "Report for week"  


