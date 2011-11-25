Given /^User "([^\"]*)" has "(\d+)" projects and 2\* "(\d+)" \+1 tasks in the system$/ do |username,projects, tasks| 
  step 'Logged in as "'+username+'"'

  Project.transaction do
    (1..projects.to_i).each do |i|
      Project.create(:name => "Company name "+i.to_s)
    end
  end

  user1 = User.find_by_username(username)
  Task.transaction do
    (-tasks.to_i..tasks.to_i).each do |i|
      (-projects.to_i..projects.to_i).each do |j|
        Task.create(:user_id => user1, :description => "Description "+i.to_s, :task_name => "Task name"+i.to_s, :external_link => "http://mail.ru", :start_time =>(Date.today + i.days).strftime("%Y/%m/%d 11:00"), :end_time => (Date.today + i.days).strftime("%Y/%m/%d 14:55"))
      end
    end
  end
end 
