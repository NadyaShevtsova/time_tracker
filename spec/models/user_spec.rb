require File.dirname(__FILE__) + '/../spec_helper'
 
  describe User do
    it "Created User should be valid" do
      user = Factory.create(:user)
      user.errors.should be_blank
      user.should be_valid
    end
  
    it "Created user Admin should be valid" do
      user = Factory.create(:admin)
      user.errors.should be_blank
      user.should be_valid
    end
  
    it "User with blank username should not be created" do
      user  = Factory.build(:user, :username => nil)
      user.should_not be_valid
      user.errors[:username].should_not be_blank
    end

    it "should be just_created" do
      user  = Factory.create(:user, :email => "ad@mambo.ru", :username => "alex")
      user.just_created? == true
    end

    it "should not be just_created" do
      user  = Factory.build(:user, :created_at => "2011-11-06 17:15:10")
      user.just_created? == false
    end


  end
