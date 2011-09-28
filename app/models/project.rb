class Project < ActiveRecord::Base
  has_many   :tasks, :dependent => :destroy
  belongs_to :users

  validates :name, :presence => true
end
