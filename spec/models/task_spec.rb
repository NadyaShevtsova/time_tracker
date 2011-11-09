require File.dirname(__FILE__) + '/../spec_helper'
 
  describe Task do
    it "Created task should be valid" do
      task = Factory.create(:task)
      task.errors.should be_blank
      task.should be_valid
    end
    
    it "Task with blank task_name, description should not be created" do
      task = Factory.build(:task, :task_name => '', :description => '')
      task.should_not be_valid
      task.errors[:task_name].should_not be_blank
      task.errors[:description].should_not be_blank
    end
    
    it "should not be created if day of :start_time not equal day of :end_time" do
      task = Factory.build(:task, :start_time => '2011-11-01 09:00:00', :end_time => '2011-11-02 12:55:00')
      task.should_not be_valid
      (task.send :check_equality_day).should_not be_blank
    end


end
