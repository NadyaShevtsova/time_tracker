require File.dirname(__FILE__) + '/../spec_helper'
 
  describe User do
    it "User should be possible to creat a valid one" do
      user = Factory.create(:user, :email => 'bb@mamba.ru')
      user.errors.should be_blank
      user.should be_valid
      user2 = Factory.build(:user, :email => 'bb@mamba.ru')
      user2.should_not be_valid
      user2.errors[:email].should_not be_blank
    end

    it "Admin should be possible to creat a valid one" do
      user = Factory.create(:admin)
      user.errors.should be_blank
      user.should be_valid
    end

  end
