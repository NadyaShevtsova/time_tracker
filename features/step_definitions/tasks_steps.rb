Given "I have 11 tasks for user in the system" do 
  step 'I have 11 projects in the system'
  step 'I have 1 user in the system'
  (-1..1).each do |i|
    (-5..5).each do |j|
      Factory.create(:task, :description => "Description "+i.to_s, :task_name => "Task name"+i.to_s, :external_link => "http://mail.ru", :start_time =>(Date.today + i.days).strftime("%Y/%m/%d 11:00"), :end_time => (Date.today + i.days).strftime("%Y/%m/%d 14:55"))
    end
  end
end 
