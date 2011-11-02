# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:email => "admin@gmail.com", :password => "admin",:password_confirmation => "admin", :username => "admin", :admin => true, :address => "")

Project.transaction do
  (1..7).each do |i|
    Project.create(:name => Faker::Company.name)
  end
end

User.create(:username => "test", :email => "test@test.com", :password => "test", :password_confirmation => "test", :admin => false, :address => "")

User.create(:email => "user@user.com", :password => "user",:password_confirmation => "user", :username => "user", :admin => false, :address => "55 Southwest 17th Road, Miami")

user_id1 = User.find_by_username("test").id
user_id2 = User.find_by_username("user").id

Task.transaction do
  (-5..5).each do |i|
    (1..7).each do |j|
      Task.create(:user_id => user_id1, :project_id => j, :task_name => Faker::Company.name,:description => Faker::Lorem.sentence, :external_link => Faker::Internet.domain_name, :start_time => (Date.today + i.days).strftime("%Y/%m/%d 11:00"), :end_time => (Date.today + i.days).strftime("%Y/%m/%d 14:55"))
    end
  end

end
Task.transaction do
  (-5..5).each do |i|
    (1..7).each do |j|
      Task.create(:user_id => user_id2, :project_id => j, :task_name => Faker::Company.name,:description => Faker::Lorem.sentence, :external_link => Faker::Internet.domain_name, :start_time => (Date.today + i.days).strftime("%Y/%m/%d 11:00"), :end_time => (Date.today + i.days).strftime("%Y/%m/%d 14:55"))
    end
  end

end


