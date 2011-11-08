require File.dirname(__FILE__) + '/../spec_helper'
 
  describe Task do
    it "It should be possible to creat a valid one" do
      project = Factory(:project)
      user = Factory(:user)
      task = Factory(:task, :user_id => user.id, :project_id => project.id)
      task.should be_valid
      task.should_not be_new_record
  end
end
