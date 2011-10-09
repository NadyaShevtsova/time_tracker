class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :description, :start_time, :end_time,  :user_id, :project_id, :presence => true
  validates_datetime :end_time, :after => :start_time, :after_message => "must be at least Start time"
  validates :external_link, :format => {:with => /((http|https):\/\/|[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/}, :allow_blank => true

  before_validation :check_http

  private

  def check_http
     self.external_link = "http://#{self.external_link}" if self.external_link.grep(/(http:\/\/|https:\/\/)/).empty? and !self.external_link.blank?
  end

end
