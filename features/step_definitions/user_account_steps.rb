World(Rack::Test::Methods)

Given "I have 1 user in the system" do 
  Factory.create(:user, :username => "user")
  step 'I am on the home page'
  step 'I should see "You need to sign in or sign up before continuing."'
end
