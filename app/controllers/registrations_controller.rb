class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    session[:omniauth] = nil unless @user.new_record? 
  end

  def update_address
    if current_user.update_attribute(:address, params['update_address'])
      render :nothing => true, :status => 200
    end
  end
  
  private
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end


