class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :description, :start_time, :end_time,  :user_id, :project_id, :presence => true
  validates_url_format_of :external_link, :allow_nil => true, :allow_blank => true, :message => "incorrect external link"
  validates_datetime :end_time, :after => :start_time, :after_message => "must be at least Start time"

end
