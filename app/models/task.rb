class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  accepts_nested_attributes_for :project

  validates :task_name, :project, :presence => true
  validates :description, :start_time, :end_time,  :user, :presence => true
  validates_datetime :end_time, :after => :start_time, :after_message => "must be at least Start time"
  validates :external_link, :format => {:with => /((http|https):\/\/|[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/}, :allow_blank => true

  before_validation :check_http
  validate :check_equality_day


  private

  def check_http
     self.external_link = "http://#{self.external_link}" if self.external_link.grep(/(http:\/\/|https:\/\/)/).empty? and !self.external_link.blank?
  end

  def check_equality_day
    begin
      start_time.to_date
    rescue 
      errors.add(:start_time, ": run-time should take only one day")
      return false
    end
    begin
      end_time.to_date 
    rescue 
      errors.add(:end_time, ": run-time should take only one day")
      return false
    end
    if self.start_time.to_date != self.end_time.to_date
      errors.add(:end_time, ": run-time should take only one day")
    end
  end
end
