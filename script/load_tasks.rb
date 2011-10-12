Project.transaction do
  (1..20).each do |i|
    Project.create(:name => Faker::Company.name)
  end
end

User.create(:username => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test")

User.create(:email => "user@user.com", :password => "user",:password_confirmation => "user", :username => "user", :admin => false)

user_id1 = User.find_by_username("test").id
user_id2 = User.find_by_username("user").id

Task.transaction do
  (-5..5).each do |i|
    (1..20).each do |j|
      Task.create(:user_id => user_id1, :project_id => j,  :task_name => Faker::Company.name,:description => Faker::Lorem.sentence, :external_link => Faker::Internet.domain_name, :start_time => (Date.today + i.days).strftime("%Y/%m/%d 11:00"), :end_time => (Date.today + i.days).strftime("%Y/%m/%d 14:55"))
    end
  end

end
Task.transaction do
  (-5..5).each do |i|
    (1..20).each do |j|
      Task.create(:user_id => user_id2, :project_id => j,  :task_name => Faker::Company.name,:description => Faker::Lorem.sentence, :external_link => Faker::Internet.domain_name, :start_time => (Date.today + i.days).strftime("%Y/%m/%d 11:00"), :end_time => (Date.today + i.days).strftime("%Y/%m/%d 14:55"))
    end
  end

end

