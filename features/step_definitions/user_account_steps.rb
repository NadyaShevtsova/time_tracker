World(Rack::Test::Methods)

Given "Entrance on site" do
  step 'I am on the home page'
  step 'I should see "You need to sign in or sign up before continuing." within "#flash_alert"'
end

When /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  
  visit new_user_session_path
  fill_in("user_username", :with => username)
  fill_in("user_password", :with => password)
  click_button("Sign in")
#  User.find_by_username(username).should_not be_nil
end

Given /^I have user "([^\"]*)" in the system$/ do |username|
  if (username!="admin")
    Factory.create(:user, :username => username, :password =>username, :password_confirmation =>username)  
  else
    Factory.create(:admin, :username => "admin", :password => "admin", :password_confirmation => "admin",:email => "admin@gmail.com")
  end 
  step 'Entrance on site'
end

Given /^Logged in as "([^\"]*)"$/ do |username|
  step 'I have user "'+username+'" in the system'
  step 'I am logged in as "'+username+'" with password "'+username+'"' 
  step 'I should see "Signed in successfully."'
  if username == "admin"
    step 'I should see "Reports for week"'  
  end
end






