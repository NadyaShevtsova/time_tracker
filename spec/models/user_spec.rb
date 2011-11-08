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
      user  = Factory.build(:user, :username => '')
      user.should_not be_valid
      user.errors[:username].should_not be_blank
    end

  end
