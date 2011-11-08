require File.dirname(__FILE__) + '/../spec_helper'
 
  describe Project do
    it "It should be possible to creat a valid one" do
      project = Factory(:project)
      project.should be_valid
      project.should_not be_new_record
  end
end
