class Authentication < ActiveRecord::Base
  belongs_to :user
  scope :twitter, :conditions => {:provider => "twitter"}
  scope :facebook, :conditions => {:provider => "facebook"}
end
