World(Rack::Test::Methods)

Given "Entrance on site" do
  step 'I am on the home page'
  step 'I should see "You need to sign in or sign up before continuing." within "#flash_alert"'
end

Given "I have 1 user in the system" do 
  user = Factory.create(:user, :username => "user")
  @email = user.email
  step 'Entrance on site'
end 

Given "User admin presens in the system" do 
  Factory.create(:admin, :username => "admin", :password => "admin", :password_confirmation => "admin",:email => "admin@gmail.com")
  step 'Entrance on site'
end

Given "I was logined as user" do 
  step 'I have 1 user in the system'
  step 'I fill in "Username" with "user"'
  step 'I fill in "Password" with "user"'
  step 'I press "Sign in"'
  step 'I should see "Signed in successfully."'
end


