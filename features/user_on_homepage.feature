Feature: I am user and I am on  home page
  If I am on home page I can be able to
    create new task
    edit existing task
    delete existing task
    select next page or specific page
    select Number items on page
    follow to my profile
    view report for specific week if I am admin

  @javascript
  Scenario: I can see my tasks on selected day, select number items on page  
   Given User "Piter" has 5 projects, and each project has 2 tasks, each task has 1 descriptions from 2 days ago to 3 days since
   And should see "Description 211" within "table#tasks"
   When I follow "2" within ".pagination"
   Then I should see "Description 321" within "table#tasks"
   When I follow "Next" within ".pagination"
   Then I should see "Description 511" within "table#tasks"
   When I select "5" from "per_page"
   Then I should see "Description 311" within "table#tasks"
   When I select "all" from "per_page"
   Then I should see "Description 521" within "table#tasks"
   When I follow "2" within ".ui-datepicker-calendar"
   Then I should see "2011/12/02 Description 511" within "table#tasks"
   
  @javascript
  Scenario: I cann't create new task with empty fields 
    Given I am "Piter" and I follow "New Task" within ".new_task_link"
    And I should see "New task" within "h1"
    And I wait for the ajax request to finish
   #    And I fill in "Task name" with "myTask"
    And I press "Save"  
    Then should see "Task name can't be blank"
    Then should see "Project can't be blank"
    Then should see "Descriptions description name can't be blank"
    Then should see "End time must be at least Start time"

  @javascript
  Scenario: I can create new task, edit and destroy one 
    Given I am "Piter" and I follow "New Task" within ".new_task_link"
    And I should see "New task" within "h1"
    And I wait for the ajax request to finish
    And I select "add_project" from "task_project_id"
    And I fill in "task_project_attributes_name" with "Project 1"
    And I fill in "Task name" with "myTask"
    And I fill in "task[descriptions_attributes][0][description_name]" with "Description made by Piter"
    And I fill in "task_start_time" with "14:00"
    And I fill in "task_end_time" with "17:00"
    And I fill in "task_external_link" with "mail.ru"
    When I press "Save"  
    Then I should see "Task added success" within "#flash_notice"
    When I follow "Edit"
    Then I should see "Editing task"
    And I wait for the ajax request to finish
    And I fill in "Task name" with "new myTask"
    And I press "Save"
    Then I should see "Task was successfully updated." within "#flash_notice" 
    #    When I follow "Destroy"
    #    Then I should see "Are you sure?"


  
