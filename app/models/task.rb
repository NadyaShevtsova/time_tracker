class Task < ActiveRecord::Base
  belongs_to :project

  validates :description, :start_time, :end_time, :presence => true
  validates_url_format_of :external_link, :allow_nil => true, :allow_blank => true, :message => "incorrect external link"
  validates_datetime :end_time, :after => :start_time, :after_message => "must be at least Start time"

end
