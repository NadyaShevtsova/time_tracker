require File.dirname(__FILE__) + '/../spec_helper'
 
  describe Project do
    it "should not be valid with the same names" do
      project = Factory.create(:project, :name => "Schaefer-Haley")
      project.should be_valid

      project2 = Factory.build(:project, :name => "Schaefer-Haley")
      project2.should_not be_valid
      project2.errors[:name].should_not be_blank
    end

    it "should not be created with blank name" do
      project = Factory.build(:project, :name => nil)
      project.should_not be_valid
      project.errors[:name].should_not be_blank
    end
    
  end
