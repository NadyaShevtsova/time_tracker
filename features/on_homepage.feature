Feature: I am on  home page
  If I am on home page I can be able to
    create new task
    edit existing task
    delete existing task
    select next page or specific page
    select Number items on page
    follow to my profile
    view report for specific week if I am admin

  Scenario: I cannt create new task with empty fields 
    Given I was logined as user
    And I follow "New Task" within ".new_task_link"
    Then I should see "New task" within "h1"
