require File.dirname(__FILE__) + '/../spec_helper'
 
  describe Task do
    it "It should be possible to creat a valid one" do
      task = Factory.create(:task)
      task.errors.should be_blank
      task.should be_valid
  end
end
