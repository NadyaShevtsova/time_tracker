Given /^User "([^\"]*)" has (\d+) projects, and each project has (\d+) tasks, each task has (\d+) descriptions from (\d+) days ago to (\d+) days since$/ do |username, projects, tasks, descriptions, from, to|
  step %{I have user "#{username}" in the system}
  
  user1 = nil
  if(username == "admin")
    step "I have user \"Antony\" in the system"
    user1 = User.find_by_username("Antony")
  else
    user1 = User.find_by_username(username)
  end

  task_hash = []
  projects.to_i.times do |project_index|
    project = Project.create(:name => "Company name #{project_index.next}")

    (-from.to_i..to.to_i).each do |period|
      tasks.to_i.times do |task_id|
        descriptions.to_i.times do |number_descriptions|
          task_hash << {
            :user => user1,
            :project => project,
            :task_name => "Task name #{project_index.next}#{task_id.next}",
            :external_link => "http://mail.ru",
            :start_time => period.days.since.strftime("%Y/%m/%d 11:00"),
            :end_time => period.days.since.strftime("%Y/%m/%d 14:55"),
            :descriptions_attributes => { "#{number_descriptions}" => {:description_name => "#{ period.days.since.strftime("%Y/%m/%d")} Description #{project_index.next}#{task_id.next}#{number_descriptions.next}"}}
          }
#          Description.create(:task_id => task.id, :description_name => "#{ period.days.since.strftime("%Y/%m/%d")} Description #{project_index.next}#{task_id.next}#{number_descriptions.next}")
        end
      end
    end
  end
  Task.create(task_hash)

  step "Logged in as \"#{username}\""
end
