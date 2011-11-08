require File.dirname(__FILE__) + '/../spec_helper'
 
  describe Project do
    it "Created project should be valid" do
      project = Factory.create(:project)
      project.errors.should be_blank
      project.should be_valid
    end

    it "Project with blank name should not be created" do
      project = Factory.build(:project, :name => '')
      project.should_not be_valid
      project.errors[:name].should_not be_blank
    end

  end
