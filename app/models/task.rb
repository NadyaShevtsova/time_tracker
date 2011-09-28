class Task < ActiveRecord::Base
  belongs_to :projects

  validates :description, :start_time, :exernal_link, :presence => true
end
