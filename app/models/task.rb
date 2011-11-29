require Rails.root.join("lib/check_equality_day_validator.rb")

class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many   :descriptions, :dependent => :destroy

  accepts_nested_attributes_for :project
  accepts_nested_attributes_for :descriptions

  validates :task_name, :presence => true
  validates :project, :presence => true
  validates :start_time, :presence => true, :timeliness => {:type => :datetime}
  validates :end_time, :presence => true, :timeliness => {:after => :start_time, :type => :datetime, :after_message => "must be at least Start time"}
  validates :user, :presence => true
  validates :external_link, :format => {:with => /((http|https):\/\/|[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/}, :allow_blank => true

  before_validation :check_http
  validates_with CheckEqualityDayValidator


  private

  def check_http
     self.external_link = "http://#{self.external_link}" if self.external_link.grep(/(http:\/\/|https:\/\/)/).empty? and !self.external_link.blank?
  end
end
