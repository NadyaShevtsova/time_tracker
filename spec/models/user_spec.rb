require File.dirname(__FILE__) + '/../spec_helper'
 
  describe User do
    it "It should be possible to creat a valid one" do
      user = Factory(:user)
      user.should be_valid
      user.should_not be_new_record
  end
end
