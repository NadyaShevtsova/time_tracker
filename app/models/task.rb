class Task < ActiveRecord::Base
  belongs_to :projects

  validates :description, :start_time, :external_link, :presence => true
  validates_url_format_of :external_link, :allow_nil => true,
    :message => "incorrect external link"

end
