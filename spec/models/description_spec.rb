require 'spec_helper'

describe Description do
  it "should not be created with blank description_name" do
      description = Factory.build(:description, :description_name => nil)
      description.should_not be_valid
      description.should have(1).error_on(:description_name)
    end

  it "should be valid" do
      project = Factory.create(:description)
      project.should be_valid
    end
  
end
