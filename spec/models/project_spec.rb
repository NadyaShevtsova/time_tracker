require File.dirname(__FILE__) + '/../spec_helper'
 
  describe Project do
    it "It should be possible to creat a valid one" do
      project = Factory.create(:project)
      project.errors.should be_blank
      project.should be_valid
    end
end
