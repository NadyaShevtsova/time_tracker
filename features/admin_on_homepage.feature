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
    Given User "admin" has 1 projects, and each project has 1 tasks, each task has 1 descriptions from 2 days ago to 3 days since
    And I follow "week (2011/11/28 - 2011/12/04)"
    And I should see "Report for week"  
    And I should see "Company name 1"
    Then show me the page
    #    When I follow "Back"
    #Then I should see "Your tasks for today" within "h2"


  Scenario: I am admin  
    Given User "admin" has 3 projects, and each project has 2 tasks, each task has 2 descriptions from 2 days ago to 3 days since
    And I should see "Antony"  
    And I should see "Company name 1"
    

 
