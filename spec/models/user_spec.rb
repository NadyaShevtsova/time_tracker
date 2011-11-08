require File.dirname(__FILE__) + '/../spec_helper'
 
  describe User do
    it "User should be possible to creat a valid one" do
      user = Factory(:user)
      user.should be_valid
      user.should_not be_new_record
    end

    it "Admin should be possible to creat a valid one" do
      user = Factory(:admin)
      user.should be_valid
      user.should_not be_new_record
    end

  end
