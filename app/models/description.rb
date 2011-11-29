class Description < ActiveRecord::Base
  belongs_to :task

  validates :description_name, :presence => true
#  validates :task, :presence => true

end
