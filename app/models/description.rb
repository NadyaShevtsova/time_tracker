class Description < ActiveRecord::Base
  belongs_to :task

  validates :description_name, :presence => true

end
