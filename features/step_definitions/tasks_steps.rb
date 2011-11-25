Given /^User "([^\"]*)" has (\d+) projects and (\d+) tasks from (\d+) days ago to (\d+) days since in the system$/ do |username, projects, tasks, from, to|
  step "Logged in as \"#{username}\""


  user1 = User.find_by_username(username)

  projects.to_i.times do |project_index|
    project = Project.create(:name => "Company name #{project_index}")

    (-from.to_i..to.to_i).each do |period|
      tasks.to_i.times do |task_id|
        Task.create({
          :user => user1,
          :project_id => project.id,
          :description => "Description #{task_id}",
          :task_name => "Task name #{task_id}",
          :external_link => "http://mail.ru",
          :start_time => period.days.since.strftime("%Y/%m/%d 11:00"),
          :end_time => period.days.since.strftime("%Y/%m/%d 14:55")
        })
      end
    end
  end
end
