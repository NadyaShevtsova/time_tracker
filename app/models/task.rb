class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  accepts_nested_attributes_for :project

  validates :task_name, :presence => true
  validates :project, :presence => true
  validates :description, :presence => true
  validates :start_time, :presence => true, :timeliness => {:type => :datetime}
  validates :end_time, :presence => true, :timeliness => {:after => :start_time, :type => :datetime, :after_message => "must be at least Start time"}
  validates :user, :presence => true
  validates :external_link, :format => {:with => /((http|https):\/\/|[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/}, :allow_blank => true

  before_validation :check_http
  validate :check_equality_day


  private

  def check_http
     self.external_link = "http://#{self.external_link}" if self.external_link.grep(/(http:\/\/|https:\/\/)/).empty? and !self.external_link.blank?
  end

  def check_equality_day
    if errors.blank?
      if self.start_time.to_date != self.end_time.to_date
        errors.add(:end_time, ": run-time should take only one day")
      end
    end
  end
end
