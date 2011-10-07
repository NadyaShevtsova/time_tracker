# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:email => "admin@gmail.com", :password => "admin",:password_confirmation => "admin", :username => "admin", :admin => true)
User.create(:email => "user@user.com", :password => "user",:password_confirmation => "user", :username => "user", :admin => false)
User.create(:email => "test@mail.ru", :password => "test",:password_confirmation => "test", :username => "test", :admin => false)
User.create(:email => "antony@yandex.ru", :password => "antony",:password_confirmation => "antony", :username => "antony", :admin => false)

Project.create(:name => "stone", :user_id => 2)
Project.create(:name => "test", :user_id => 3)
Project.create(:name => "line", :user_id => 4)

Task.create(:description => "added new stone", :start_time => "2011-10-07 10:00:00", :end_time => "2011-10-07 11:41:00", :external_link => "http://mail.ru", :project_id => 1, :user_id => 2)
Task.create(:description => "new test", :start_time => "2011-10-06 09:40:00", :end_time => "2011-10-06 10:35:00", :external_link => "http://gmail.com", :project_id => 2, :user_id => 3) 
Task.create(:description => "new line", :start_time => "2011-10-07 12:10:00", :end_time => "2011-10-07 14:21:00", :external_link => "http://rambler.ru", :project_id => 3, :user_id => 4)

Task.create(:description => "kfjdhwshs", :start_time => "2011-10-07 11:12:00", :end_time => "2011-10-07 13:14:00", :external_link => "http://rambler.ru", :project_id => 2, :user_id => 2) 
Task.create(:description => "kjdhsghshs kskssl", :start_time => "2011-10-07 08:13:00", :end_time => "2011-10-07 10:15:00", :external_link => "http://rambler.ru", :project_id => 3, :user_id => 3) 
Task.create(:description => "khg bvgfhnhgf", :start_time => "2011-10-07 15:30:00", :end_time => "2011-10-07 16:25:00", :external_link => "http://rambler.ru", :project_id => 1, :user_id => 4) 
