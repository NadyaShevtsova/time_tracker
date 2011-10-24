class User < ActiveRecord::Base
  has_many :authentications
  has_many :tasks, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :admin

  validates :username, :presence => true

  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if omniauth["provider"].eql?("facebook")
    self.username = omniauth['user_info']['nickname'] ? omniauth['user_info']['nickname'] : omniauth['user_info']['email'].split('@').first
    self.password = self.password_confirmation = Digest::SHA1.hexdigest("--@#{self.username}-123548")[0,6] 
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    authentications.empty? && super
  end

  private
end
