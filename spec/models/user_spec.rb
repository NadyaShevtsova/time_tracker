require "#{Rails.root}/spec/spec_helper"

  describe User do
    it "Created User should be valid" do
      user = Factory.create(:user)
      user.should be_valid
      user.admin.should be_false
    end

    it "Created user Admin should be valid" do
      user = Factory.create(:admin)
      user.should be_valid
      user.admin.should be_true
    end

    it "User with blank username should not be created" do
      user  = Factory.build(:user, :username => nil)
      user.should_not be_valid
      user.errors[:username].should_not be_blank
    end

    it "should be just_created" do
      user  = Factory.create(:user, :email => "ad@mambo.ru", :username => "alex")
      user.should be_valid
      user.just_created?.should be_true
    end

    it "should not be just_created" do
      user  = Factory.create(:user, :created_at => "2011-11-06 17:15:10")
      user.should be_valid
      user.just_created?.should be_false
    end

    it "created via facebook should be valid" do
      omniauth = {'user_info' => {'email' => Faker::Internet.email,'nickname' => Faker::Internet.user_name}, 'provider' => "facebook"}
      user = User.new
      user.apply_omniauth(omniauth)
      user.should be_valid
    end

    it "created via facebook should not be valid with blank 'email' and :username" do
      omniauth = {'user_info' => {'email' => '','nickname' => ''}, 'provider' => "facebook"}
      user = User.new
      user.apply_omniauth(omniauth)
      user.should_not be_valid
      user.errors[:email].should_not be_blank
      user.errors[:username].should_not be_blank
    end

    it "created via twitter should not be valid because fields 'email' are blank" do
      omniauth = {'user_info' => {'email' => '','nickname' => Faker::Internet.user_name}, 'provider' => "twitter"}
      user = User.new
      user.apply_omniauth(omniauth)
      user.should_not be_valid
      user.errors[:email].should_not be_blank
    end

    it "password should be String type" do
      user  = Factory.create(:user)
      user.should be_valid
      user.generate_password.should be_a_kind_of(String)
      user.generate_password.should have(6).characters
      user.generate_password.should eq(Digest::SHA1.hexdigest("--@#{user.username}-123548")[0,6])
    end
  end


