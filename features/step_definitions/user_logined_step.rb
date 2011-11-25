Given "I am user and I follow to New Task" do 
  step 'Logged in as "Luay"'
  step 'I follow "New Task" within ".new_task_link"'
  step 'I should see "New task" within "h1"'
end

Given "I am admin and I follow to week (2011/10/31 - 2011/11/06)" do 
  step 'Logged in as "admin"'
  step 'I follow "New Task" within ".new_task_link"'
  step 'I should see "New task" within "h1"'
end

Given /^I am "([^\"]*)" and I am on edit_my_profile page$/ do |username|
  step 'Logged in as "'+username+'"'
  step 'I follow "Your profile" within "#link_profile"'
end

