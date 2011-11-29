require "#{Rails.root}/spec/spec_helper"

  describe Task do
    it "should be valid" do
      task = Factory.create(:task)
      task.should be_valid
    end

    it "with blank task_name, start_time, end_time should not be created" do
      task = Factory.build(:task, :task_name => nil, :start_time => '', :end_time => '')
      task.should_not be_valid
      task.errors[:task_name].should_not be_blank
      task.errors[:start_time].should_not be_blank
      task.errors[:end_time].should_not be_blank
    end

    it "with invalid :start_time should not be created" do
      task = Factory.build(:task,:start_time => 'aaa')
      task.should_not be_valid
      task.errors[:start_time].should_not be_blank
    end

    it "with invalid :end_time should not be created" do
      task = Factory.build(:task,:end_time => 'aaa')
      task.should_not be_valid
      task.errors[:end_time].should_not be_blank
    end

    it "should not be created if day of :start_time not equal day of :end_time" do
      task = Factory.build(:task, :start_time => '2011-11-01 09:00:00', :end_time => '2011-11-02 12:55:00')
      task.should_not be_valid
    end

    it "should be created with empty :external_link" do
      task = Factory.create(:task, :external_link => '')
      task.send :check_http
      task.should be_valid
      task.external_link.should be_blank
    end

    it "should be successful created with :external_link => 'mail.ru' " do
      task = Factory.create(:task, :external_link => 'mail.ru')
      task.send :check_http
      task.should be_valid
      task.external_link.grep(/(http:\/\/|https:\/\/)/).empty?.should be_false
      task.external_link.should eq('http://mail.ru')
    end

    it "should be successful created with :external_link => 'http://mail.ru' " do
      task = Factory.create(:task, :external_link => 'http://mail.ru')
      task.external_link.grep(/(http:\/\/|https:\/\/)/).empty?.should be_false
      task.send :check_http
      task.should be_valid
      task.external_link.should eq('http://mail.ru')
    end
end
