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

Given /^I am "([^\"]*)" and I follow "([^"]*)"(?: within "([^"]*)")?$/ do |username, link, selector|
  step 'Logged in as "'+username+'"'
  with_scope(selector) do
    click_link(link)
  end
end

