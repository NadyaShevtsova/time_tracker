Feature: I am user and I am on  home page
  If I am on home page I can be able to
    create new task
    edit existing task
    delete existing task
    select next page or specific page
    select Number items on page
    follow to my profile
    view report for specific week if I am admin

#  @javascript
  Scenario: I cannt create new task with empty fields 
    Given I am "Piter" and I follow "New Task" within ".new_task_link"
    And I should see "New task" within "h1"
#    And I fill in "Task name" with "myTask"
#    When I press "Save"  
    #    Then should see "Task name can't be blank"
    #Then should see "Project can't be blank"
    #Then should see "Description can't be blank"
    #Then should see "End time must be at least Start time"
    Then show me the page

# @javascript
  Scenario: I can see 3 projects  
   Given User "Piter" has "5" projects and 2* "2" +1 tasks in the system
   #    Then show me the page


