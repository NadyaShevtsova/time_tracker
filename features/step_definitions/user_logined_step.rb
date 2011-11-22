Given "I was entered to the system as user" do 
  step 'I was logined as user'
  step 'I follow "New Task" within ".new_task_link"'
  step 'I should see "New task" within "h1"'
end

